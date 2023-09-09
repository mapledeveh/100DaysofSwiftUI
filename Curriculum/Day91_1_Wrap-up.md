# Flashzilla: Wrap up

This was our another super-sized project, but also another one where we covered some really great techniques like gestures, haptics, Combine, and more. When these features work together we can do remarkable things in our apps, providing an experience to users that is seamless and delightful.

You also saw once again the importance of ensuring accessibility in our apps. It’s easy to get carried away with cool gestures and more, but then forget that straying from standard UI also means we need to up our game when it comes to VoiceOver and more. Anyone can make a good idea, but to make a *great* app means you’ve taken into account the needs of everyone.

# Challenge
One of the best ways to learn is to write your own code as often as possible, so here are some ways you should try extending this app to make sure you fully understand what’s going on.

1. When adding a card, the textfields keep their current text – fix that so that the textfields clear themselves after a card is added.
2. If you drag a card to the right but not far enough to remove it, then release, you see it turn red as it slides back to the center. Why does this happen and how can you fix it? (Tip: think about the way we set **offset** back to 0 immediately, even though the card hasn’t animated yet. You might solve this with a ternary within a ternary, but a custom modifier will be cleaner.)
3. For a harder challenge: when the users gets an answer wrong, add that card goes back into the array so the user can try it again. Doing this successfully means rethinking the **ForEach** loop, because relying on simple integers isn’t enough – your cards need to be uniquely identifiable.

Still thirsty for more? Try upgrading our loading and saving code in two ways:

1. Make it use documents JSON rather than **UserDefaults** – this is generally a good idea, so you should get practice with this.
2. Try to find a way to centralize the loading and saving code for the cards. You might need to experiment a little to find something you like!