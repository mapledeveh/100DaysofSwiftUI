# Project 17, part 2

Cory House once said, “code is like humor. When you have to explain it, it’s bad.” I’ve touched on something similar previously – the need to write clear code that effectively communicates our intent is the mark of good programming, and it will save many hours of maintenance and testing in the future.

Today you’re going to be learning about monitoring notifications using Apple’s Combine framework, and you’ll see that the code is so simple it barely requires any explanation at all – and that’s despite it letting us do all sorts of monitoring for system events.

This doesn’t happen by accident: Apple spends a lot of time doing API *review*, which is when cross-functional teams of developers get together to discuss what we call the *surface* area of an API – how it looks to us end-user developers in terms of what parameters they take, what they return, how they are named, whether they throw errors, and how they fit together in context. API review is harder than you might think, but the end result is we get great functionality with remarkably little Swift and SwiftUI code, so it’s a big win for us!

**Today you have three topics to work through, in which you’ll learn about the Combine framework, **Timer**, and reading specific accessibility settings.**

- Triggering events repeatedly using a timer
- How to be notified when your SwiftUI app moves to the background
- Supporting specific accessibility needs with SwiftUI
