# <center>Project 9, part 2

Today we’re going to be continuing our look at SwiftUI’s drawing systems by getting a little creative – I think you’ll be surprised how easy it is to make something entrancing just by combining most of what you know with a couple of new techniques.

Today you’re also going to meet the **drawingGroup()** modifier, which lets us combine view rendering together into a single pass powered by Apple’s high-performance graphics API, Metal. Lots of people have asked me in the past whether I plan to write a book on Metal, and the answer is a definitive *no* – not only is there [a very good one already](https://www.google.com/search?client=safari&rls=en&q=Metal+Programming+Guide%3A+Tutorial+and+Reference+via+Swift&ie=UTF-8&oe=UTF-8), but it’s also remarkably hard to get anything good out of the APIs.

That isn’t because Metal is bad – trust me, it’s incredible! – but instead because Apple’s finest engineers have worked hard to make SwiftUI as efficient as possible when working with Metal, and, bluntly, it is extremely unlikely that I can do a better job.

As you’ll find, switching Metal isn’t something you’ll need often, even though it is easy to do. Famous software developer Kent Beck once said our process should be “make it work, make it right, make it fast”, and he’s quite correct. But if you find your drawing works fast *without* switching to Metal it’s usually best left as-is.

Anyway, enough chat – I said we’d make something entrancing, so let’s get to it!

**Today you have three topics to work through, in which you’ll learn about CGAffineTransform, ImagePaint, drawingGroup(), and more.**

- Transforming shapes using CGAffineTransform and even-odd fills
- Creative borders and fills using ImagePaint
- Enabling high-performance Metal rendering with drawingGroup()
