# Animation: Wrap up

This technique project started off easier, took a few twists and turns, and progressed into more advanced animations, but I hope it’s given you an idea of just how powerful – and how flexible! – SwiftUI’s animation system is.

As I’ve said previously, animation is about both making your app look great and also adding extra meaning. So, rather than making a view disappear abruptly, can you add a transition to help the user understand something is changing?

Also, don’t forget what it looks like to be playful in your user interface. My all-time #1 favorite iOS animation is one that Apple ditched when they moved to iOS 7, and it was the animation for deleting passes in the Wallet app – a metal shredder appeared and cut your pass into a dozen strips that then dropped away. It only took a fraction of a second more than the current animation, but it was beautiful and fun too!

Review what you learned
Anyone can sit through a tutorial, but it takes actual work to remember what was taught. It’s my job to make sure you take as much from these tutorials as possible, so I’ve prepared a short review to help you check your learning.

Click here to review what you learned in this project.

Challenge
One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

Go back to the Guess the Flag project and add some animation:

When you tap a flag, make it spin around 360 degrees on the Y axis.
Make the other two buttons fade out to 25% opacity.
Add a third effect of your choosing to the two flags the user didn’t choose – maybe make them scale down? Or flip in a different direction? Experiment!
These challenges aren’t easy. They take only a few lines of code, but you’ll need to think carefully about what modifiers you use to get the exact animations you want. Try adding an @State property to track which flag the user tapped on, then using that inside conditional modifiers for rotation, fading, and whatever you decide for the third challenge.