# <center> Project 16, part 2

Today you’re going to tackle a tricky concept in the form of Swift’s **Result** type, but to balance things out we’re also going to cover two easier ones too so hopefully you don’t find today too much work.

Swift’s **Result** type is designed to solve the problem when you know thing A might be true or thing B might be true, but exactly one can be true at any given time. If you imagine those as Boolean properties, then each has two states (true and false), but together they have four states:

1. A is false and B is false
2. A is true and B is false
3. A is false and B is true
4. A is true and B is true

If you know for sure that options 1 and 4 are never possible – that either A or B must be true but they can’t both be true – then you can immediately halve the complexity of your logic.

American author Ursula K Le Guin once said that “the only thing that makes life possible is permanent, intolerable uncertainty; not knowing what comes next.” The absolute *opposite* is true of good software: the more certainty we can enforce and the more constraints we can apply, the safer our code is and the more work the Swift compiler can do on our behalf.

So, although **Result** requires you to think about escaping closures being passed in as parameters, the pay off is smarter, simpler, *safer* good – totally worth it.

**Today you have three topics to work through, in which you’ll learn about **Result**, **objectWillChange**, and image interpolation.**

- Manually publishing ObservableObject changes
- Understanding Swift’s Result type
- Controlling image interpolation in SwiftUI