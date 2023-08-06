# What you learned

These last three projects have really pushed hard on data, starting first with sending and receiving data using the internet, then going into Core Data so you can see how real apps manage their data. The skills you’ve learned in this projects are perhaps more important than you realize, because if you put them all together you can now fetch data from the internet, store it locally, and let users filter to find the stuff they care about.

Here’s a quick recap of all the new things we covered in the last three projects:

- Building custom **Codable** conformance
- Sending and receiving data using **URLSession**
- The **disabled()** modifier for views
- Building custom UI components using **@Binding**
- Adding multiple buttons to an alert
- How Swift’s **Hashable** protocol is used in SwiftUI
- Using the **@FetchRequest** property wrapper to query Core Data
- Sorting Core Data results using **SortDescriptor**
- Creating custom **NSManagedObject** subclasses
- Filtering data using **NSPredicate**
- Creating relationships between Core Data entities

That’s a comparatively short list compared to some other projects, but I think it’s fair to say these topics have been a real step up: Core Data is hard in places, particularly how we need to bridge  things like **NSSet** so they play nicely in the bright and airy future of SwiftUI.