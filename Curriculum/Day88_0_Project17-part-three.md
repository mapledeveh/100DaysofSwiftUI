# Project 17, part 3

When Steve Jobs announced the very first iPhone back in January 2007, he talked about how users would interact with their new device. Take a look at what he said:

> “We’re going to use the best pointing device in the world. We’re going to use a pointing device that we’re all born with – born with ten of them. We’re going to use our fingers. We’re going to touch this with our fingers. And we have invented a new technology called multi-touch, which is phenomenal – it works like magic.”

It’s a mark of how impactful the iPhone was on our industry that those words seem obvious today – of *course* we use our fingers to swipe around, what else would we use? I still have a Windows Mobile phone from the same year that the first iPhone shipped, and it has a hardware keyboard (actual physical keys you press), along with a tiny stylus that you need to use to tap the screen. Even something like scrolling around requires you to grab a scrollbar with the stylus and drag it around, and this thing shipped *after* the iPhone.

Bethany Bongiorno (who, along with Toby Paterson, led the software engineering program for the first iPad), recently said they would “sit in our offices for hours playing with full-screen Google Street View on the iPad tethered units we were using for development… it was one of the moments that I remember us saying out loud – wow, this is going to blow people away.”

We’re going to start our app implementation today by building draggable cards, and I hope you can stop to appreciate how *good* it feels to manipulate on-screen UI using your fingers. The iPhone is almost entirely a massive sheet of glass, and great gestures help make our apps feel *real* – use them wisely!

**Today you have three topics to work through, in which you’ll build a card stack, add gestures, then use those gestures to control the rest of your user interface.**

- Designing a single card view
- Building a stack of cards
- Moving views with DragGesture and offset()