# Dynamically filtering a SwiftUI List

SwiftUI’s **List** view likes to work with arrays of objects that conform to the **Identifiable** protocol, or at least can provide some sort of **id** parameter that is guaranteed to be unique. However, there’s no reason these need to be *stored* properties of a view, and in fact if we send in a *computed* property then we’re able to adjust our filtering on demand.

In our app, we have three instances of **ProspectsView** that vary only according to the **FilterType** property that gets passed in from our tab view. We’re already using that to set the title of each view, but we can also use it to set the contents for a **List**.

The easiest way to do this is using Swift’s **filter()** method. This runs every element in a sequence through a test you provide as a closure, and any elements that return true from the test are sent back as part of a new array. Our **ProspectsView** already has a **prospects** property being passed in with an array of people inside it, so we can either return all people, all contacted people, or all uncontacted people.

Add this property to **ProspectsView** below the previous two:
```
var filteredProspects: [Prospect] {
    switch filter {
    case .none:
        return prospects.people
    case .contacted:
        return prospects.people.filter { $0.isContacted }
    case .uncontacted:
        return prospects.people.filter { !$0.isContacted }
    }
}
```
When **filter()** runs, it passes every element in the people array through our test. So, **$0.isContacted** means “does the current element have its **isContacted** property set to true?” All items in the array that pass that test – that have **isContacted** set to true – will be added to a new array and sent back from **filteredResults**. And when we use **!$0.isContacted** we get the opposite: only prospects that haven’t been contacted get included.

With that computed property in place, we can now create a **List** to loop over that array. This will show both the title and email address for each prospect using a **VStack**, and we’ll also use a **ForEach** so we can add deleting later on.

Replace the existing text view in **ProspectsView** with this:
```
List {
    ForEach(filteredProspects) { prospect in
        VStack(alignment: .leading) {
            Text(prospect.name)
                .font(.headline)
            Text(prospect.emailAddress)
                .foregroundColor(.secondary)
        }
    }
}
```
If you run the app again you’ll see things are starting to look much better.

Before we move on, I want you to think about this: now that we’re using a computed property, how does SwiftUI know to refresh the view when the property changed? The answer is actually quite simple: it doesn’t.

When we added an **@EnvironmentObject** property to **ProspectsView**, we also asked SwiftUI to reinvoke the **body** property whenever that property changes. So, whenever we insert a new person into the **people** array its **@Published** property wrapper will announce the update to all views that are watching it, and SwiftUI will reinvoke the **body** property of **ProspectsView**. That in turn will calculate our computed property again, so the **List** will change.

I love the way SwiftUI transparently takes on so much work for us here, which means we can focus on how we filter and present our data rather than how to connect up all the pipes to make sure things are kept up to date.