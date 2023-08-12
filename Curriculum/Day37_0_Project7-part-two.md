# <center> Project 7, part 2

Today you’re going to build a complete app using **@ObservedObject, @Published, sheet(), Codable, UserDefaults**, and more. I realize that seems like a lot, but I want you to try to think about all the things that are happening in the background:

- **@Published** publishes change announcements automatically.
- **@StateObject** watches for those announcements and refreshes any views using the object.
- **sheet()** watches a condition we specify and shows or hides a view automatically.
- **Codable** can convert Swift objects into JSON and back with almost no code from us.
- **UserDefaults** can read and write data so that we can save settings and more instantly.

Yes, we need to write the code to put those things in place, but so much boilerplate code has been removed that what remains is quite remarkable. As French writer and poet Antoine de Saint-Exupery once said, “perfection is achieved not when there is nothing more to add, but rather when there is nothing more to take away.”

**Today you have five topics to work through, in which you’ll put into practice everything you learned about @StateObject, sheet(), onDelete(), and more.**

- Building a list we can delete from
- Working with Identifiable items in SwiftUI
- Sharing an observed object with a new view
- Making changes permanent with UserDefaults
- Final polish

That’s another app built, and lots more techniques used in context too – great job!