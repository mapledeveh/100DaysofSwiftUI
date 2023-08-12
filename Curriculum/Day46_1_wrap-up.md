# Drawing: Wrap up

We covered a *huge* amount of ground in this project, and you’ve learned about paths, shapes, strokes, transforms, drawing groups, animating values, and more. Not everyone will want to use all those features, and that’s OK – hopefully you have a clear idea of which parts interested you the most, and have some good coding experience with them.

If you combine your new-found drawing abilities with all the animation functionality we covered back in project 6, I hope you’re starting to realize just how much power and flexibility SwiftUI gives us. Yes, you can of course create whole apps using **List**, **NavigationView**, and similar, but you can also build completely custom user interfaces that look fantastic and are just as fast.

# Challenge

One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

- Create an **Arrow** shape – having it point straight up is fine. This could be a rectangle/triangle-style arrow, or perhaps three lines, or maybe something else depending on what kind of arrow you want to draw.
- Make the line thickness of your **Arrow** shape animatable.
- Create a **ColorCyclingRectangle** shape that is the rectangular cousin of ColorCyclingCircle, allowing us to control the position of the gradient using one or more properties.

**Tip:** Gradient positions like **.top** and **.bottom** are actually instances of **UnitPoint**, and you can create your own **UnitPoint** instances with X/Y values ranging from 0 to 1.