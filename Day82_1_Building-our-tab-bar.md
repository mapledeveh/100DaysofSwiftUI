# Building our tab bar

This app is going to display four SwiftUI views inside a tab bar: one to show everyone that you met, one to show people you have contacted, another to show people you haven’t contacted, and a final one showing your personal information for others to scan.

Those first three views are variations on the same concept, but the last one is quite different. As a result, we can represent all our UI with just three views: one to display people, one to show our data, and one to bring all the others together using **TabView**.

So, our first step will be to create placeholder views for our tabs that we can come back and fill in later. Press Cmd+N to make a new SwiftUI view and call it “ProspectsView”, then create another SwiftUI view called “MeView”. You can leave both of them with the default “Hello, World!” text view; it doesn’t matter for now.

For now, what matters is **ContentView**, because that’s where we’re going to store our **TabView** that contains all the other views in our UI. We’re going to add some more logic here shortly, but for now this is just going to be a **TabView** with three instances of **ProspectsView** and one MeView. Each of those views will have a **tabItem()** modifier with an image that I picked out from SF Symbols and some text.

Replace the body of your current **ContentView** with this:
```
TabView {
    ProspectsView()
        .tabItem {
            Label("Everyone", systemImage: "person.3")
        }
    ProspectsView()
        .tabItem {
            Label("Contacted", systemImage: "checkmark.circle")
        }
    ProspectsView()
        .tabItem {
            Label("Uncontacted", systemImage: "questionmark.diamond")
        }
    MeView()
        .tabItem {
            Label("Me", systemImage: "person.crop.square")
        }
}
```
If you run the app now you’ll see a neat tab bar across the bottom of the screen, allowing us to tap through each of our four views.

Now, obviously creating three instances of **ProspectsView** will be weird in practice because they’ll just be identical, but we can fix that by customizing each view. Remember, we want the first one to show every person you’ve met, the second to show people you have contacted, and the third to show people you haven’t contacted, and we can represent that with an enum plus a property on **ProspectsView**.

So, add this enum inside **ProspectsView** now:
```
enum FilterType {
    case none, contacted, uncontacted
}
```
Now we can use that to allow each instance of **ProspectsView** to be slightly different by giving it a new property:
```
let filter: FilterType
```
This will immediately break **ContentView** and **ProspectsView_Previews** because they need to provide a value for that property when creating **ProspectsView**, but first let’s use it to customize each of the three views just a little by giving them a navigation bar title.

Start by adding this computed property to **ProspectsView**:
```
var title: String {
    switch filter {
    case .none:
        return "Everyone"
    case .contacted:
        return "Contacted people"
    case .uncontacted:
        return "Uncontacted people"
    }
}
```
Now replace the default “Hello, World!” body text with this:
```
NavigationView {
    Text("Hello, World!")
        .navigationTitle(title)
}
```
That at least makes each of the **ProspectsView** instances look slightly different so we can be sure the tabs are working correctly.

To make our code compile again we need to make sure that every ProspectsView initializer is called with a filter. So, in **ProspectsView_Previews** change the body to this:
```
ProspectsView(filter: .none)
```
Then change the three **ProspectsView** instances in **ContentView** so they have filter: .none, filter: .contacted, and filter: .uncontacted respectively.

If you run the app now you’ll see it’s looking better. Now for the real challenge: those first three views need to work with the same data, so how can we share it all smoothly? For that we need to turn to SwiftUI’s environment…

