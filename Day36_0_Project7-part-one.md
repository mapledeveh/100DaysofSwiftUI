# <center>Project 7, part 1

Linus Torvalds, the creator of the open source Linux operating system, was once asked if he had any advice for developers who wanted to build a large software project. Here is the response he gave:

>*Nobody should start to undertake a large project. You start with a small trivial project, and you should never expect it to get large. If you do, you'll just overdesign and generally think it is more important than it likely is at that stage. Or worse, you might be scared away by the sheer size of the work you envision.*

In writing this course, I’ve already had people emailing me asking “why didn’t I use X to solve a problem in project 1?” or “Y would have been much better than Z in project 4.” They are probably right, but if I tried to teach you everything in project 1 you’d have found it overwhelming and unpleasant, so instead we built a small app. Then in project 2 we built a second small app. Then we built a third and a fourth, with each one adding to your skills.

Today you’ll start project 7, which is still most definitely a small app. However, in the process you’ll learn how to show another screen, how to share data across screens, how to load and save user data, and more – the kinds of features that really help take your SwiftUI skills to the next level.

That doesn’t mean the app is perfect – as you’ll learn later, UserDefaults isn’t the ideal choice for what we’re doing here, and instead something like the much bigger and more complex Core Data would be a better fit – but that’s okay. Remember, we’re setting out to build something small and work our way up, rather than just jumping into one all-encompassing mega-project.

If you’re all set, let’s get to it!

**Today you have seven topics to work through, in which you’ll learn about @StateObject, sheet(), onDelete(), and more**.

- iExpense: Introduction
- Why @State only works with structs
- Sharing SwiftUI state with @StateObject
- Showing and hiding views
- Deleting items using onDelete()
- Storing user settings with UserDefaults
- Archiving Swift objects with Codable