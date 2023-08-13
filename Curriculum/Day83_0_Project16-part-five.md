# <center> Project 16, part 5

There’s a classic computer science book called *Structure and Interpretation of Computer Programs*, and in the preface the authors write some important words: “programs must be written for people to read, and only incidentally for machines to execute.”

It’s worth reading that a few times, because it has a massive impact on the way we write software. Why do we force ourselves to use data types when languages such as JavaScript let you mix and match strings, integers, and even arrays freely? Why do we add comments to our code? Why do we try to break things up into functions? Why do we have access control?

All those and many more can be answered by that single quote: because our goal must always be to make our intent clear to ourselves and other developers. The CPU running our code doesn’t care about data types, comments, access control, and more, but if you want to write great software that is scalable, testable, and maintainable, you need to add some rules.

We’re actually going to use some interesting access control today, relying on two Swift features that don’t get used nearly enough: the fileprivate access control, and custom access control for setters. As with many features these aren’t the kinds of things you’ll use every day, but it’s just one more skill to add to your growing collection and worth keeping around!

**Today you have three topics to work through, in which you’ll write the “Me” tab, scan a QR code, then add swipe actions to our app.**

- Generating and scaling up a QR code
- Scanning QR codes with SwiftUI
- Adding options with swipe actions