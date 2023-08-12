# Fixing Guess the Flag

Way back in project 2 we made Guess the Flag, which showed three flag pictures and asked the users to guess which was which. Well, based on what you now know about VoiceOver, can you spot the fatal flaw in our game?

That’s right: SwiftUI’s default behavior is to read out the image names as their VoiceOver label, which means anyone using VoiceOver can just move over our three flags to have the system announce which one is correct.

To fix this we need to add text descriptions for each of our flags, describing them in enough detail that they can be guessed correctly by someone who has learned them, but of course without actually giving away the name of the country.

If you open your copy of this project, you’ll see it was written to use an array of country names, like this:
```
@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
```
So, the easiest way to attach labels there – the way that doesn’t require us to change any of our code – is to create a dictionary with country names as keys and accessibility labels as values, like this. Please add this to **ContentView**:
```
let labels = [
    "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
    "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
    "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
    "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
    "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
    "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
    "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
    "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
    "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
    "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
    "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
]
```
And now all we need to do is add the **accessibilityLabel()** modifier to the flag images. I realize that sounds simple, but the code has to do three things:

1. Use **countries[number]** to get the name of the country for the current flag.
2. Use that name as the key for **labels**.
3. Provide a string to use as a default if somehow the country name doesn’t exist in the dictionary. (This should never happen, but there’s no harm being safe!)

Putting all that together, put this modifier directly below the rest of the modifiers for the flag images:
```
.accessibilityLabel(labels[countries[number], default: "Unknown flag"])
```
And now if you run the game again you’ll see it actually is a game, regardless of whether you use VoiceOver or not. This gets right to the core of accessibility: everyone can have fun playing this game now, regardless of their access needs.