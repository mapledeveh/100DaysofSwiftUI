# Designing a single card view

In this project we want users to see a card with some prompt text for whatever they want to learn, such as “What is the capital city of Scotland?”, and when they tap it we’ll reveal the answer, which in this case is of course Edinburgh.

A sensible place to start for most projects is to define the data model we want to work with: what does one card of information look like? If you wanted to take this app further you could store some interesting statistics such as number of times shown and number of times correct, but here we’re only going to store a string for the prompt and a string for the answer. To make our lives easier, we’re also going to add an example card as a static property, so we have some test data for previewing and prototyping.

So, create a new Swift file called Card.swift and give it this code:
```
struct Card {
    let prompt: String
    let answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
```
In terms of showing that in a SwiftUI view, we need something slightly more complicated: yes there will be two text labels shown one above the other, but we also need to show a white card behind them to bring our UI to life, then add just a touch of padding to the text so it doesn’t quite go to the edge of the card behind it. In SwiftUI terms this means a **VStack** for the two labels, inside a **ZStack** with a white **RoundedRectangle**.

I don’t know if you’ve used flashcards to learn before, but they have a very particular shape that makes them wider than they are high. This makes sense if you think about it: you’re usually only writing two or three lines of text, so it’s more natural to write long-ways than short-ways.

All our apps so far haven’t really cared about device orientation, but we’re going to make this one work only in landscape. This gives us more room to draw our cards, and it will also work better once we introduce gestures later on.

To force landscape mode, go to your target options in the Info tab, open the disclosure indicator for the key “Supported interface orientations (iPhone)” and delete the portrait option so it leaves just the two landscape options.

With that done we can take our first pass at a view to represent one card in our app. Create a new SwiftUI view called “CardView” and give it this code:
```
struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)

            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
    }
}
```
Tip: A width of 450 is no accident: the smallest iPhones have a landscape width of 480 points, so this means our card will be fully visible on all devices.

That will break the **CardView_Previews** struct because it requires a **card** parameter to be passed in, but we already added a static example directly to the **Card** struct for this very purpose. So, update the **CardView_Previews** struct to this:
```
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
```
If you take a look at the preview you should see our example card showing, but you can’t actually see that it’s a card – it has a white background, and so does it doesn’t stand out against the default background of our view. This will become doubly problematic when we have a stack of cards to work through, because they’ll all have white backgrounds and kind of blend into each other.

There’s a simple fix for this: we can add a shadow to the **RoundedRectangle** so we get a gentle depth effect. This will help us right now by making our white card stand out from the white background, but when we start adding more cards it will look even better because the shadows will add up.

So, add this modifier below the **fill(.white)**:
```
.shadow(radius: 10)
```
Now, right now you can see both the prompt and the answer at the same time, but obviously that isn’t going to help anyone learn. So, to finish this step we’re going to hide the answer label by default, and toggle its visibility whenever the card is tapped.

So, start by adding this new **@State** property to **CardView**:
```
@State private var isShowingAnswer = false
```
Now wrap the answer view in a condition for that Boolean, like this:
```
if isShowingAnswer {
    Text(card.answer)
        .font(.title)
        .foregroundColor(.gray)
}
```
That simple change means it will only show the answer when **isShowingAnswer** is true.

The final step is to add an **onTapGesture()** modifier to the **ZStack**, by putting this code after the **frame()** modifier:
```
.onTapGesture {
    isShowingAnswer.toggle()
}
```
That’s our card view done for the time being, so if you want to see it in action go back to ContentView.swift and replace its **body** property with this:
```
var body: some View {
    CardView(card: Card.example)
}
```
When you run the project you’ll see the app jumps into landscape mode automatically, and our default card appears – a good start!