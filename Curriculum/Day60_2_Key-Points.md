# Key points

Although we’ve covered a lot in these last three projects, there are two things in particular I’d like to cover in more detail: type erasure and **Codable**. We already looked at these a little in our projects, but they deserve some additional time as you’ll see…

## Sending back varying views

SwiftUI’s views have only one requirement, which is that they have a **body** property that returns some specific sort of view. As we looked at in an earlier technique project, specifying the precise return type is painful because of the way SwiftUI builds containers when we apply modifiers, which is why we have **some View** – “this will return one specific sort of view, but we don’t want to say what.”

However, Swift does something really clever to help make our lives easier: it automatically adds the **@ViewBuilder** attribute to the **body** property of all SwiftUI views. This only happens with body rather than any kind of property that returns **some View**, but it silently adds an important superpower: we get to return multiple views, and we get to return *different* views depending on conditions too.

However, because *other* properties don’t have access to this superpower by default: they can’t return a text view sometimes and an image other times, but thanks to the way SwiftUI wraps views with modifier containers it even means they can’t mix and match many modifiers.

So, code such as this is invalid:
```
struct ContentView: View {
    var randomText: some View {
        if Bool.random() {
            return Text("Hello, World!")
                .frame(width: 300)
        } else {
            return Text("Hello, World!")
        }
    }

    var body: some View {
        randomText
    }
}
```
(Note: I’ve placed the code into **randomText** for demonstration purposes; obviously in a real project you’d either have a lot more code elsewhere in your view, or put that right inside body.)

There are various ways we can solve this:

- We can wrap our views in another view called **AnyView**, which uses type erasure to hide its contents.
- We can manually add the **@ViewBuilder** annotation to other properties.
- We can wrap the code inside the property in a **Group**, which means only a single view is returned.
- Using a ternary conditional operator to supply differing values.

I want to walk through each of these options so you can see what they look like, and also how they compare.

*Type erasure* is the process of hiding the underlying type of some data. This is used often in Swift: we have type erasing wrappers such as **AnyHashable** and **AnySequence**, and all they do is act as shells that forward on their operations to whatever they contain, without revealing what the contents are to anything externally.

In SwiftUI we have **AnyView** for this purpose: it can hold any kind of view inside it, which allows us to mix and match views freely, like this:
```
struct ContentView: View {
    var randomText: some View {
        if Bool.random() {
            return AnyView(Text("Hello, World!")
                .frame(width: 300))
        } else {
            return AnyView(Text("Hello, World!"))
        }
    }

    var body: some View {
        randomText
    }
}
```
However, there is a performance cost to using **AnyView**: by hiding the way our views are structured, we’re forcing SwiftUI to do a lot more work when our view hierarchy changes – if we make one small change inside one of the type-erased parts of our view hierarchy, there’s a good chance it will all need to be recreated.

Like I said, there are alternatives, and one of them is to manually add the **@ViewBuilder** attribute anywhere it’s needed, like this:
```
struct ContentView: View {
    @ViewBuilder var randomText: some View {
        if Bool.random() {
            Text("Hello, World!")
                .frame(width: 300)
        } else {
            Text("Hello, World!")
        }
    }

    var body: some View {
        randomText
    }
}
```
With that in place we no longer need **AnyView** or the **return** keywords, because it’s all handled by **@ViewBuilder** – we’ve made the **randomText** property work just like **body**.

There are lots of places where using **@ViewBuilder** is a great solution, including places where you need to return very different kinds of view. However, please don’t abuse it: if you find yourself needing to use **@ViewBuilder** often it might mean you’re trying to cram too much logic into your SwiftUI views, and there’s a good chance you’ll do better by chopping them into smaller views.

Another alternative is to use **Group** rather than **@ViewBuilder**, like this:
```
struct ContentView: View {
    var randomText: some View {
        Group {
            if Bool.random() {
                Text("Hello, World!")
                    .frame(width: 300)
            } else {
                Text("Hello, World!")
            }
        }
    }

    var body: some View {
        randomText
    }
}
```
Honestly, that’s no different from using **@ViewBuilder**. Yes, behind the scenes there’s an extra SwiftUI view in play (the **Group** view), but it will have no effect on layout and that extra view will probably just be optimized away.

The last option isn’t always possible, but it is possible here and you should always watch out for it: where you can use it, a ternary conditional operator is always a better choice than any of the above solutions.

Many of SwiftUI’s modifiers, including **frame()**, allow us to pass **nil** instead of a value, which causes the modifier to do nothing. Some other modifiers like **blur()** and **opacity()** don’t allow **nil** to be passed, but you can also provide default values that do nothing at all – **blur(radius: 0)** and **opacity(1)**, for example. These are called an *inert modifiers*, and SwiftUI will just remove them before laying out the result.

So, the ideal version of our code is this:
```
struct ContentView: View {
    var randomText: some View {
        Text("Hello, World!")
            .frame(width: Bool.random() ? 300 : nil)
    }

    var body: some View {
        randomText
    }
}
```
Why “ideal”? Because in this situation SwiftUI only creates a single text view. Yes, the width changes between a fixed 300 points and the default size of the text, but the actual rendered text that gets created isn’t changing. In comparison, using **AnyView**, **@ViewBuilder**, and **Group** all involve two views: when the **Bool.random()** value flips from one state to the other, the first text view will be destroyed and a new one will be created.

There is at least one time you really do need the type erasing powers of **AnyView**, but it really should be your last choice. For example, you can’t make an array of groups, because **[Group]** by itself has no meaning – SwiftUI wants to know what’s *in* the group. On the other hand, **[AnyView]** is perfectly fine, because the point of **AnyView** is that the contents don’t matter.

So, this kind of code is only possible with actual type erasure:
```
struct ContentView: View {
    @State private var views = [AnyView]()

    var body: some View {
        VStack {
            Button("Add Shape") {
                if Bool.random() {
                    views.append(AnyView(Circle().frame(height: 50)))
                } else {
                    views.append(AnyView(Rectangle().frame(width: 50)))
                }
            }

            ForEach(0..<views.count, id: \.self) {
                views[$0]
            }

            Spacer()
        }
    }
}
```
Every time you tap the button a shape gets added to the array, but because both **Shape** and **Group** are meaningless the array must be typed **[AnyView]**.

If you intend to use type erasure regularly, it’s worth adding this convenience extension:
```
extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}
```
With this approach we can treat erasedToAnyView() like a modifier:
```
Text("Hello World")
    .font(.title)
    .erasedToAnyView()
```
As very rough guidance, you should:

1. Aim to use ternary conditional operators rather than use **if** conditions.
2. Prefer to break large views up into smaller views rather than add complex logic in your view hierarchy.
3. Use **Group** to avoid the 10-view limit, or to add modifier such as **navigationTitle()** where it would otherwise not be possible.
4. Use an explicit **@ViewBuilder** only for simple properties, but be wary of using it to mask complex logic when really a new view might make more sense.
5. Fall back on **AnyView** if none of the other options would work.

## Codable keys

When we have JSON data that matches the way we’ve designed our types, **Codable** works perfectly. In fact, if we don’t use property wrappers such as **@Published**, we often don’t need to do anything other than add **Codable** conformance – the Swift compiler will synthesize everything we need automatically.

However, a lot of the time things aren’t so straightforward. In these situations we might need to write custom **Codable** conformance – i.e., writing **init(from:)** and **encode(to:)** by hand – but there is a middle ground where, with some guidance, **Codable** can still do most of the work for us.

One common example of this is where our incoming JSON using a different naming convention for its properties. For example, we might receive JSON property names in snake case (e.g. **first_name**) whereas our Swift code uses property names in camel case (e.g. **firstName**). **Codable** is able to translate between these two as long as it knows what to expect – we need to set a property on our decoder called **keyDecodingStrategy**.

To demonstrate this, here’s a **User** struct with two properties:
```
struct User: Codable {
    var firstName: String
    var lastName: String
}
```
And here is some JSON data with the same two properties, but using snake case:
```
let str = """
{
    "first_name": "Andrew",
    "last_name": "Glouberman"
}
"""
```
let data = Data(str.utf8)
If we try to decode that JSON into a **User** instance, it won’t work:
```
do {
    let decoder = JSONDecoder()

    let user = try decoder.decode(User.self, from: data)
    print("Hi, I'm \(user.firstName) \(user.lastName)")
} catch {
    print("Whoops: \(error.localizedDescription)")
}
```
However, if we modify the key decoding strategy before we call **decode()**, we can ask Swift to convert snake case to and from camel case. So, this will succeed:
```
do {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    let user = try decoder.decode(User.self, from: data)
    print("Hi, I'm \(user.firstName) \(user.lastName)")
} catch {
    print("Whoops: \(error.localizedDescription)")
}
```
That works great when we’re converting snake_case to and from camelCase, but what if our data is completely different?

As an example, take a look at this JSON:

let str = """
{
    "first": "Andrew",
    "last": "Glouberman"
}
"""
It still has the first and last name of a user, but the property names don’t match our struct at all.

When we were looking at **Codable** I said that we can create an enum of coding keys that describe which keys should be encoded and decoded. At the time I said “this enum is conventionally called **CodingKeys**, with an S on the end, but you can call it something else if you want,” and while that’s true it’s not the whole story.

You see, the reason we conventionally use **CodingKeys** for the name is that this name has super powers: if a **CodingKeys** enum exists, Swift will automatically use it to decide how to encode and decode an object for times we don’t provide custom **Codable** implementations.

I realize that’s a lot to take in, so it’s best demonstrated with some code. Try changing the **User** struct to this:
```
struct User: Codable {
    enum ZZZCodingKeys: CodingKey {
        case firstName
    }

    var firstName: String
    var lastName: String
}
```
That code will compile just fine, because the name **ZZZCodingKeys** is meaningless to Swift – it’s just a nested enum. But if you rename the enum to just **CodingKeys** you’ll find the code no longer builds: we’re now instructing Swift to encode and decode just the **firstName** property, which means there is no initializer that handles setting the **lastName** property - and that’s not allowed.

All this matters because **CodingKeys** has a second super power: if we attach raw value strings to our properties, Swift will use those for the JSON property names. That is, the case names should match our Swift property names, and the case values should match the JSON property names.

So, let’s return to our example JSON:
```
let str = """
{
    "first": "Andrew",
    "last": "Glouberman"
}
"""
```
That uses “first” and “last” for property names, whereas our **User** struct uses **firstName** and **lastName**. This is a great place where **CodingKeys** can come to the rescue: we don’t need to write a custom **Codable** conformance, because we can just add coding keys that marry up our Swift property names to the JSON property names, like this:
```
struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }

    var firstName: String
    var lastName: String
}
```
Now that we have specifically told Swift how to convert between JSON and Swift naming, we no longer need to use **keyDecodingStrategy** – just adding that enum is enough.

So, while you *do* need to know how to create custom **Codable** conformance, it’s generally best practice to do without it if these other options are possible.