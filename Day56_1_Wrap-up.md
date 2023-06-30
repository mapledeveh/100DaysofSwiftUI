# Bookworm: Wrap up

Congratulations on finishing another SwiftUI project! With technologies like Core Data at your side, you’re now capable of building some serious apps that interact with the user and – most importantly – *remember* what they entered. Although we only scratched the surface or Core Data, it’s capable of a *lot* more and I expect Apple to keep expanding the link between Core Data and SwiftUI in future updates. In the meantime, the very next project focuses deeply on Core Data – there’s lots to explore!

As for the other things you learned, you’ve now even more of SwiftUI’s property wrappers, and I hope you’re getting a sense for which one to choose and when. **@Binding** is particularly useful when building custom UI components, because its ability to share data between views is just so useful.

There’s one last thing I’d like to leave you with, and it’s something you might not even have noticed. When we built a star rating component, we created something that became a user-interactive control just like **Button** and **Slider**. However, we *didn’t* stop to consider how it works with accessibility and that’s a problem: **Button**, **Slider**, and others work great of the box, but as soon as we start creating our own components we need to step in and do that work ourselves.

Building apps that are accessible for everyone is something everyone needs to take seriously, which is why I’ve dedicated a whole technique project to it in the future – we’re going to be looking back at the previous projects we’ve made and seeing how we can improve them.

Anyway, first things first – you have a new review and some challenges. Good luck!

# Challenge

One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

1. Right now it’s possible to select no title, author, or genre for books, which causes a problem for the detail view. Please fix this, either by forcing defaults, validating the form, or showing a default picture for unknown genres – you can choose.
2. Modify **ContentView** so that books rated as 1 star are highlighted somehow, such as having their name shown in red.
3. Add a new “date” attribute to the Book entity, assigning **Date.now** to it so it gets the current date and time, then format that nicely somewhere in **DetailView**.