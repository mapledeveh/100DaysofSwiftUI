# <center>Key points</center>

There are three important points that are worth going over in more detail. This will partly be reviewing what we learned – going over it again with different examples to help make sure they are clear – but I also want to take this chance to answer some questions that are likely to have cropped up so far.

## **Structs vs classes**
First, something that should hopefully be fairly fresh in your memory: structs and classes. These are both ways of letting us build complex data types with properties and methods, but the way they work – more specifically, how they *differ* – matters.

If you remember, there are five key differences between structs and classes:

 1. Classes don't come with a memberwise initializer; structs get these by default.
 2. Classes can use inheritance to build up functionality; structs cannot.
 3. If you copy a class, both copies point to the same data; copies of structs are always unique.
 4. Classes can have deinitializers; structs cannot.
 5. You can change variable properties inside constant classes; properties inside constant structs are fixed regardless of whether the properties are constants or variables.

In Apple's original programming language, Objective-C, we used classes for pretty much *everything* – we didn't have a choice, because it was really baked into the way things worked.

In Swift we *do* have a choice, and that choice ought to be based upon those factors above. I say "ought to be” because it's not uncommon to see folks who don't care about these differences, and so use either **class** or **struct** all the time without considering the ramifications of that choice.

Whether you choose structs or classes is down to you and the specific problems you're solving. However, what I *want* you to do is consider how it conveys your *intent*. Donald Knuth said that "programs are meant to be read by humans and only incidentally for computers to execute”, which really gets to the heart of what I'm talking about: when someone reads your code, is your intent clear to them?

If you use structs most of the time, switching to a class in one particular place conveys some intent: this thing is different and needs to be used differently. If you *always* use classes, that distinction gets lost – after all, it's extremely unlikely you need them that often.

**Tip:** One of the fascinating details of SwiftUI is how it completely inverts how we use structs and classes. In UIKit we would use structs for data and classes for UI, but in SwiftUI it's completely the opposite – a good reminder of the importance of learning things, even if you think they aren't immediately useful.

## **Working with ForEach**
The second thing I'd like to discuss is **ForEach**, which we have used with code like this:
```
ForEach(0 ..< 100) { number in
    Text("Row \(number)")
}
```
**ForEach** is a view just like most other things in SwiftUI, but it allows us to create other views inside a loop. In doing so, it also allows us to bypass the ten-child limit that SwiftUI imposes – the **ForEach** itself becomes one of the 10, rather than the things inside it.

Now consider a string array like this:
```
let agents = ["Cyril", "Lana", "Pam", "Sterling"]
```
How could we loop over those and make text views?

One option is to use the same construction we already have:
```
VStack {
    ForEach(0..<agents.count) {
        Text(agents[$0])
    }
}
```
But SwiftUI offers us a second alternative: we can loop over the array directly. This takes a little more thinking, because SwiftUI wants to know how it can identify each item in the array.

Think about it: if we loop over a four-item array we will create four views, but if **body** gets re-invoked and our array now contains *five* items, SwiftUI needs to know which view is new so it can be shown in the UI. The last thing SwiftUI wants to do is throw away its whole layout and start from scratch every time a small change is made. Instead, it wants to do the least amount of work possible: it wants to leave the existing four views in place and add only the fifth.

So, we come back to how Swift can identify values in our array. When we were using a range such as **0..<5** or **0..<agents.count**, Swift knew for sure that each item was unique because it would use the numbers from the range – each number was used only once in the loop, so it would definitely be unique.

In our array of strings that's no longer possible, but we can clearly see that each value is unique: the values in ["Cyril", "Lana", "Pam", "Sterling"] don't repeat. So, what we can do is tell SwiftUI that the strings themselves – "Cyril”, "Lana”, etc – are what can be used to identify each view in the loop uniquely.

In code, we'd write this:
```
VStack {
    ForEach(agents, id: \.self) {
        Text($0)
    }
}
```
So rather than loop over integers and use that to read into the array, we're now reading items in the array directly – just like a **for** loop would do.

As you progress with SwiftUI we'll look at a third way of identifying views using the **Identifiable** protocol, but that will come in time.

## **Working with bindings**

When we use controls such as **Picker** and **TextField** we create two-way bindings for them to some sort of **@State** property using **$propertyName**. This works great for simple properties, but sometimes – only sometimes, hopefully! – you might want something more advanced: what if you want to run some logic to calculate the current value? Or what if you want to do more than just stash away a value when it's written?

If we want to react to changes in a binding, we might try to leverage Swift's **didSet** property observer, but you'd be disappointed. This is where custom bindings come in: they can be used just like **@State** bindings, except we get complete control over how they work.

Bindings aren't magic: **@State** takes away some boring boilerplate code for us, but it's perfectly possible to create and manage bindings by hand if you want to. Again, I'm not showing you this because it's common, because it's really not; my hope is that you'll need to do this rarely. Instead, I'm showing it to you because I want to eliminate the idea that SwiftUI is doing some sort of magic on your behalf.

Everything that SwiftUI does for us can be done by hand, and although it's nearly always better to rely on the automatic solution it can be really helpful to take a peek behind the scenes so you understand *what* it's doing on your behalf.

First let's look at the simplest form of custom binding, which just stores the value away in another **@State** property and reads that back:
```
struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        let binding = Binding(
            get: { selection },
            set: { selection = $0 }
        )

        return VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
        }
    }
}
```
So, that binding is effectively just acting as a passthrough – it doesn’t store or calculate any data itself, but just acts as a shim between our UI and the underlying state value that is being manipulated.

However, notice that the picker is now made using **selection: binding** – no dollar sign required. We don’t need to explicitly ask for the two-way binding here because it already *is* one.

If we wanted to, we could create a more advanced binding that does more than just pass through a single value. For example, imagine we had a form with three toggle switches: does the user agree to the terms and conditions, agree to the privacy policy, and agree to get emails about shipping.

We might represent that as three Boolean **@State** properties:
```
@State var agreedToTerms = false
@State var agreedToPrivacyPolicy = false
@State var agreedToEmails = false
```
Although the user could just toggle them all by hand, we could use a custom binding to do them all at once. This binding would be true if all three of those Booleans were true, but if it got changed then it would update them all, like this:
```
let agreedToAll = Binding(
    get: {
        agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
    },
    set: {
        agreedToTerms = $0
        agreedToPrivacyPolicy = $0
        agreedToEmails = $0
    }
)
```
So now we can create four toggle switches: one each for the individual Booleans, and one control switch that agrees or disagrees to all three at once:
```
struct ContentView: View {
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false

    var body: some View {
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )

        return VStack {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
        }
    }
}
```
Again, custom bindings aren’t something you’ll want that often, but it’s so important to take the time to look behind the curtain and understand what’s going on. Even though it’s incredibly smart, SwiftUI is just a tool, not magic!