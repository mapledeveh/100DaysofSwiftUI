# <center>Project 9, part 3

Today we’re going to push your drawing skills to the limit by looking at special effects and animation. As we’re right at the advanced edge of drawing it’s fair to say these skills are less likely to be used in everyday coding, but as Ralph Waldo Emerson once said, “we aim above the mark to hit the mark.”

As you’re working through today’s topics you’ll learn how to animate shapes, and it’s another instance where SwiftUI can feel a bit like magic. As you’ve seen previously, though, it really *isn’t* magic – SwiftUI just responds to the way we configured our views. It’s a bit like a Rube Goldberg machine: we set things up exactly right, put the whole machine in motion, then watch as the correct output comes out.

Controlling animation is no different: we don’t want to have the **body** property of a view re-invoked 60 or 120 times a second in order to get smooth animation, so instead we just provide the instructions for what should change as an animation progresses. It’s not terribly discoverable – that is, you can’t stumble upon the solution by accident – but I hope you’ll agree that it’s straighforward to use.

**Today you have three topics to work through, plus one bonus topic if you’re feeling brave. You’ll learn about blend modes, animatableData, AnimatablePair, and more.**

- Special effects in SwiftUI: blurs, blending, and more
- Animating simple shapes with animatableData
- Animating complex shapes with AnimatablePair

And if you’re feeling brave:

- Creating a spirograph with SwiftUI
