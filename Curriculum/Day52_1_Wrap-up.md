# Cupcake Corner: Wrap up

Hopefully this project has shown you how to take the skills you know – SwiftUI’s forms, pickers, steppers, and navigation – and build them into an app that sends all the user’s data off to a server and processes the response.

You might not realize this yet, but the skills you learned in this project are the most important skills for the vast majority of iOS developers: take user data, send it to a server, and process the response probably accounts for half the non-trivial apps in existence. Yes, what data gets sent and how it’s used to update the UI varies massively, but the concepts are identical.

## Challenge
One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

1. Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
2. If our call to **placeOrder()** fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the **request.httpMethod = "POST"** line in your code, which should force the request to fail.
3. For a more challenging task, see if you can convert our data model from a class to a struct, then create an **ObservableObject** class wrapper around it that gets passed around. This will result in your class having one **@Published** property, which is the data struct inside it, and should make supporting **Codable** on the struct much easier.