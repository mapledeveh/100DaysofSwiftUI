# Key points

There are three things I want to discuss in more detail before we move on. Again, this is really just to make sure you’ve fully understood certain key concepts before we move on, and I hope it helps give you a sense of how Swift and SwiftUI are actually *working* underneath.

## Ranges with ForEach and List

As I’ve said several times, when we create views in a loop SwiftUI needs to understand how to identify each item uniquely so that it can animate data coming and going. This in itself isn’t complex, but there’s a particular usage that throws people off, and that’s *ranges*.

First, let’s look at some code:
```
ForEach(0..<5) {
    Text("Row \($0)")
}
```
That loops from 0 to 5, printing out some text each time. SwiftUI can be sure that every item is unique because it’s counting over a range, and ranges don’t have duplicated values.

In fact, if you look at the SwiftUI code behind our **ForEach** you’ll see it’s actually this:
```
public init(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content)
```
The view builder – the thing that actually assembles our views – will be given one integer from the range, and is expected to send back some view content that can be rendered.

Now try writing this:
```
ForEach(0...5) {
   Text("Row \($0)")
}
```
That counts from 0 *through* 5, meaning that it will create six views. Or at least it *would* create six views if it actually worked – that code doesn’t compile.

Look again at the type of data **ForEach** wants: **Range<Int>**. That’s a range of integers, but it’s a very specific range – there’s a second, very similar type called **ClosedRange<Int>**, and that’s what’s causing the problem.

When we write **0..<5** we get a **Range<Int>**, but when we write **0...5** we get a **ClosedRange<Int>**. Even though it looks similar to us, Swift considers these two range types to be different and so we can’t use a closed range with **ForEach** – it just isn’t possible right now, although I hope that will change.

## What makes a string?
From our perspective, it’s easy to imagine a string as being a fairly trivial thing: there’s one letter, then another letter, then a third, a fourth, and so on, perhaps with some punctuation scattered in there. But in practice, strings are some of the most complex features in Swift, and it’s worth taking a minute to understand what’s happening.

First, you might have noticed that code such as this isn’t allowed:
```
let name = "Paul"
let firstLetter = name[0]
```
That attempts to read the first letter of the string “Paul”. If we asked a human to “run” that code, they’d say “P”, which makes sense because that’s the first letter.

However, in practice strings are much more complicated than single letters: many emoji are made up of several characters back to back to describe what they contain. For example a simple thumbs up emoji comes in a variety of skin colors, which is achieved through a base emoji (thumbs up) then a skin tone modifier (light through dark). That ends up being multiple individual characters, but we see a single one: a thumbs up emoji with a particular color.

If Swift treated those characters individually, then reading the first letter would read the thumbs up emoji without a skin tone, and reading the second letter would read the skin tone without the thumbs up – the former would be acceptable but not quite as the sender expected, and the latter would just be weird.

Now think about code like this:
```
print(name.count)
```
That will print out how many characters are in our test string, which again seems easy enough. But as we’ve just seen, some individual characters are actually supposed to be grouped together to create a combined meaning, which means **count** can’t just return how many characters the string has. Instead, it needs to start from the first letter and count through every unique letter (taking into account all the modifiers that join together) to produce a total.

It’s not fast, but it’s guaranteed to be correct. If nothing else, that’s what I want you to take away from strings: they can be a bit tricky sometimes, but Swift is doing a huge amount of work on our behalf to make sure we don’t make mistakes by accident. This does mean more code from us when using simple strings, but it also means we get automatic support for advanced strings – including any emoji you can think of – in the future.

## Flat app bundles
In Word Scramble we looked for start.txt in our bundle, then loaded it in for use in the game. I explained then that all iOS, macOS, tvOS, and watchOS apps ship as bundles that combine their binary file (the compiled Swift program), their Info.plist, their asset catalog, and more.

One thing I *didn’t* mention is how those bundles get built, and in particular I want to mention asset catalogs and loose files.

First, asset catalogs are where we’ve been storing images that we want to use in our app, and they are more than just a fancy way of organizing pictures. In fact, when Xcode builds our asset catalog it goes through all our pictures and optimizes them for iOS devices, then puts the result into a compiled asset catalog that can be loaded efficiently. As you progress further with asset catalogs you’ll learn that they can handle vector assets, colors, textures, and much more – they are versatile things!

Second, loose assets are for all the other kinds of media in our app – text files, JSON, XML, movies, and more. If you have lots of these files you can make groups inside Xcode to organize them, but at build time that all goes away: all those files get put into a single directory called your resource directory. This happens so that when we ask the bundle to find the URL for “start.txt” it doesn’t need to search through all the directories in our app bundle, but instead can look in just one place because all the files are there.

This creates an interesting problem, and it’s one you’re guaranteed to hit sooner or later: because all your loose files from everywhere in your Xcode project end up getting placed in one resource directory, you can’t use the same asset filename twice anywhere in your project. It doesn’t matter what groups the files are in, or how far they seem apart in your Xcode project: if you have two files called start.txt in your project, your build will fail because Xcode can’t put them both into the same directory.

