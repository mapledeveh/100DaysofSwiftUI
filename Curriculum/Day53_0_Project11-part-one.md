Project 11, part 1
Today we’re starting another new project, and this is where things really start to get serious because you’ll be learning one important new Swift skill, one important new SwiftUI skill, and one important app development skill, all of which will come in useful as we build the project.

The app development skill you’ll be learning is one of Apple’s frameworks: Core Data. It’s responsible for managing objects in a database, including reading, writing, filtering, sorting, and more, and it’s hugely important in all app development for iOS, macOS, and beyond. Previously we wrote our data straight to **UserDefaults**, but that was just a short-term thing to help you along with your learning – Core Data is the real deal, used by hundreds of thousands of apps.

Canadian software developer Rob Pike (creator of the Go programming language, member of the team that developed Unix, co-creator of UTF-8, and also published author) wrote this about data:

>“Data dominates. If you've chosen the right data structures and organized things well, the algorithms will almost always be self-evident. Data structures, not algorithms, are central to programming.”

This is often shortened to “write stupid code that uses smart objects,” and as you’ll see objects don’t get much smarter than when they are backed by Core Data!

**Today you have four topics to work through, in which you’ll learn about **@Binding**, type erasure, Core Data, and more.**

- Bookworm: Introduction
- Creating a custom component with @Binding
- Accepting multi-line text input with TextEditor
- How to combine Core Data and SwiftUI