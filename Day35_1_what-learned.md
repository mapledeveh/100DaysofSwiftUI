# What you learned

At this point you should really be starting to feel comfortable with how SwiftUI works. I know that for some people it can be a massive mental speed bump, because we lose the ability to control the exact flow of our program and instead need to construct the *entire* state then just set things in flow. However, you’ve now built four complete projects, and had two deep-dive technique projects, so I hope you’re starting to get a feel for how SwiftUI works.

Although you now have two more apps you can work on if you want, along the way you picked up a number of valuable skills:

- How to read numbers from users with **Stepper**, including using its - shorter form when your label is a simple text view.
- Letting the user enter dates using **DatePicker**, including using the **displayedComponents** parameter to control dates or times.
- Working with dates in Swift, using **Date**, **DateComponents**, and **DateFormatter**
- How to bring in machine learning to leverage the full power of modern iOS devices.
- Building scrolling tables of data using **List**, in particular how it can create rows directly from arrays of data.
- Running code when a view is shown, using **onAppear()**.
- Reading files from our app bundle by looking up their path using the **Bundle** class, including loading strings from there.
- Crashing your code with **fatalError()**, and why that might actually be a good thing.
- How to check whether a string is spelled correctly, using **UITextChecker**.
- Creating animations implicitly using the **animation()** modifier.
- Customizing animations with delays and repeats, and choosing between ease-in-ease-out vs spring animations.
- Attaching the **animation()** modifier to bindings, so we can animate changes directly from UI controls.
- Using **withAnimation()** to create explicit animations.
- Attaching multiple **animation()** modifiers to a single view so that we can control the animation stack.
- Using **DragGesture()** to let the user move views around, then snapping them back to their original location.
- Using SwiftUI’s built-in transitions, and creating your own.

Yes, that’s a heck of a lot new information in just three projects, but because each topic has been covered in isolation (“how do lists work?”) then again in the context of a real project (“let’s actually use a list here”), I hope it’s all sunk in. If not, don’t be afraid to go back and review earlier chapters – they aren’t going anywhere, and it will all help you master SwiftUI.

Before moving on, I want to add one important thing: even though you might be starting to understand how SwiftUI works, you will still find – perhaps often! – that it’s hard to express exactly what you mean.

Animations are a classic example of this. With animation, we want to say “make that button – that one right there – spin around right now.” And SwiftUI really isn’t designed for such an imperative way of thinking: we can’t just say “make the button spin.”

This goes beyond the mental speed bump I mentioned earlier. You can understand how SwiftUI works, but still be drawing a blank about what it takes to make something happen. This is a particular problem for folks who have prior programming experience, because they are used to the other way of thinking – they have months, years, or perhaps even decades of muscle memory that makes it very easy to solve problems, but only if they get to dictate exactly how everything should behave.

Remember, in SwiftUI all our views – and all our animations – must be a function of our state. That means we don’t tell the button to spin, but instead attach the button’s spin amount to some state, then modify that state as appropriate. Often this becomes frustrating, because we know where we want to get to but *don’t* know how to get there.

If this hits you during the course, just relax – it’s normal, and you’re not alone. If you’ve fought with something for an hour or two and can’t quite get it right, put it to one side and try the next project, then come back in a week or so. You’ll know more, and have had more practice, plus a fresh mind never hurts.