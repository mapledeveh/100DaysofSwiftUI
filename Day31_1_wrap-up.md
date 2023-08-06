# <center> Word Scramble: Wrap up

This project was a last chance to review the fundamentals of SwiftUI before we move on to greater things with the next app. Still, we managed to cover some useful new things, not least **List, onAppear, Bundle, fatalError(), UITextChecker**, and more, and you have another app you can extend if you want to.

One thing I want to pick out before we finish is my use of **fatalError()**. If you read code from my own projects on GitHub, or read some of my more advanced tutorials, you’ll see that I rely on **fatalError()** a *lot* as a way of forcing code to shut down when something impossible has happened. The key to this technique – the thing that stops it from being recklessly dangerous – is *knowing* when a specific condition ought to be impossible. That comes with time and practice: there is no one quick list of all the places it’s a good idea to use **fatalError()**, and instead you’ll figure it out with experience.

## Challenge

One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:

1. Disallow answers that are shorter than three letters or are just our start word.
2. Add a toolbar button that calls **startGame()**, so users can restart with a new word whenever they want to.
3. Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.