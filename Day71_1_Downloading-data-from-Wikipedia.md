# Downloading data from Wikipedia

To make this whole app more useful, we’re going to modify our **EditView** screen so that it shows interesting places. After all, if visiting London is on your bucket list, you’d probably want some suggestions for things to see nearby. This might sound hard to do, but actually we can query Wikipedia using GPS coordinates, and it will send back a list of places that are nearby.

Wikipedia’s API sends back JSON data in a precise format, so we need to do a little work to define **Codable** structs capable of storing it all. The structure is this:

- The main result contains the result of our query in a key called “query”.
- Inside the query is a “pages” dictionary, with page IDs as the key and the Wikipedia pages themselves as values.
- Each page has a lot of information, including its coordinates, title, terms, and more.
We can represent that using three linked structs, so create a new Swift file called Result.swift and give it this content:
```
struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {

    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
```
We’re going to use that to store data we fetch from Wikipedia, then show it immediately in our UI. However, we need something to show while the fetch is happening – a text view saying “Loading” or similar ought to do the trick.

This means conditionally showing different UI depending on the current load state, and that means defining an enum that actually stores the current load state otherwise we don’t know what to show.

Start by adding this nested enum to **EditView**:
```
enum LoadingState {
    case loading, loaded, failed
}
```
Those cover all the states we need to represent our network request.

Next we’re going to add two properties to EditView: one to represent the loading state, and one to store an array of Wikipedia pages once the fetch has completed. So, add these two now:
```
@State private var loadingState = LoadingState.loading
@State private var pages = [Page]()
```
Before we tackle the network request itself, we have one last easy job to do: adding to our **Form** a new section to show pages if they have loaded, or status text views otherwise. We can put these **if/else if** conditions or a **switch** statement right into the **Section** and SwiftUI will figure it out.

So, put this section below the existing one:
```
Section("Nearby…") {
    switch loadingState {
    case .loaded:
        ForEach(pages, id: \.pageid) { page in
            Text(page.title)
                .font(.headline)
            + Text(": ") +
            Text("Page description here")
                .italic()
        }
    case .loading:
        Text("Loading…")
    case .failed:
        Text("Please try again later.")
    }
}
```
**Tip:** Notice how we can use **+** to add text views together? This lets us create larger text views that mix and match different kinds of formatting. That “Page description here” is just temporary – we’ll replace it soon.

Now for the part that really brings all this together: we need to fetch some data from Wikipedia, decode it into a **Result**, assign its pages to our **pages** property, then set **loadingState** to **.loaded**. If the fetch fails, we’ll set **loadingState** to **.failed**, and SwiftUI will load the appropriate UI.

Warning: The Wikipedia URL we need to load is really long, so rather than try to type it in you might want to copy and paste from the text or from my GitHub gist: http://bit.ly/swiftwiki.

Add this method to **EditView**:
```
func fetchNearbyPlaces() async {
    let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

    guard let url = URL(string: urlString) else {
        print("Bad URL: \(urlString)")
        return
    }

    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        // we got some data back!
        let items = try JSONDecoder().decode(Result.self, from: data)

        // success – convert the array values to our pages array
        pages = items.query.pages.values.sorted { $0.title < $1.title }
        loadingState = .loaded
    } catch {
        // if we're still here it means the request failed somehow
        loadingState = .failed
    }
}
```
That request should begin as soon as the view appears, so add this ****task()**** modifier after the existing ****toolbar()**** modifier:
```
.task {
    await fetchNearbyPlaces()
}
```
Now go ahead and run the app again – you’ll find that as you drop a pin our **EditView** screen will slide up and show you all the places nearby. Nice!

