

Wikipedia’s results come back to us in an order that probably seems random, but it’s actually sorted according to their internal page ID. That doesn’t help us though, which is why we’re sorting results using a custom closure.

There are lots of times when using a custom sorting function is exactly what you need, but more often than not there is one natural order to your data – maybe showing news stories newest first, or contacts last name first, etc. So, rather than just provide an inline closure to **sorted()** we are instead going to make our **Page** struct conform to **Comparable**. This is actually pretty easy to do, because we already have the sorting code written – it’s just a matter of moving it across to our **Page** struct.

So, start by modifying the definition of the **Page** struct to this:
```
struct Page: Codable, Comparable {
```    
If you recall, conforming to Comparable has only a single requirement: we must implement a < function that accepts two parameters of the type of our struct, and returns true if the first should be sorted before the second. In this case we can just pass the test directly onto the **title** strings, so add this method to the **Page** struct now:
```
static func <(lhs: Page, rhs: Page) -> Bool {
    lhs.title < rhs.title
}
```
Now that Swift understands how to sort pages, it will automatically gives us a parameter-less **sorted()** method on page arrays. This means when we set **self.pages** in **fetchNearbyPlaces()** we can now add **sorted()** to the end, like this:
```
pages = items.query.pages.values.sorted()
```
Before we’re done with this screen, we need to replace the **Text("Page description here")** view with something real. Wikipedia’s JSON data does contain a description, but it’s buried: the **terms** dictionary might not be there, and if it is there it might not have a **description** key, and if it has a **description** key it might be an empty array rather than an array with some text inside.

We don’t want this mess to plague our SwiftUI code, so again the best thing to do is make a computed property that returns the description if it exists, or a fixed string otherwise. Add this to the **Page** struct to finish it off:
```
var description: String {
    terms?["description"]?.first ?? "No further information"
}
```
With that done you can replace **Text("Page description here")** with this:
```
Text(page.description)
```
That completes **EditView** – it lets us edit the two properties of our annotation views, it downloads and sorts data from Wikipedia, it shows different UI depending on how the network request is going, and it even carefully looks through the Wikipedia content to decide what can be shown.