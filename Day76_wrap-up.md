# Accessibility: Wrap up

Accessibility isn’t something that’s “nice to have” – it should be regarded as a fundamental part of your application design, and considered from the very beginning onwards. SwiftUI didn’t get its excellent accessibility support because Apple thought about it at the last minute, but instead because it got baked in from the start – every part of SwiftUI was crafted with accessibility in mind, and we’d be doing a great disservice to our users if we didn’t match that same standard.

What’s more, I hope you can agree that adding extra accessibility is surprisingly easy – some special values here, a little grouping there, and some bonus traits are all simple things that take only minutes to add, but are the difference between “opaque” and “easy to use” for millions of people around the world.

# Challenge

The check out view in Cupcake Corner uses an image and loading spinner that don’t add anything to the UI, so find a way to make the screenreader not read them out.
Fix the list rows in iExpense so they read out the name and value in one single VoiceOver label, and their type in a hint.
Do a full accessibility review of Moonshot – what changes do you need to make so that it’s fully accessible?