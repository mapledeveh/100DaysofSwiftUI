# Fixing Word Scramble

In project 5 we built Word Scramble, a game where users were given a random eight-letter word and had to produce new words using its letters. This mostly works great with VoiceOver: no parts of the app are *inaccessible*, although that doesn’t mean we can’t do better.

To see an obvious pain point, try adding a word. You’ll see it slide into the table underneath the prompt, but if you tap into it with VoiceOver you’ll realize it isn’t read well: the letter count is read as “five circle”, and the text is a separate element.

There are a few ways of improving this, but probably the best is to make both those items a single group where the children are ignored by VoiceOver, then add a label for the whole group that contains a much more natural description.

Our current code looks like this:
```
List(usedWords, id: \.self) { word in
    HStack {
        Image(systemName: "\(word.count).circle")
        Text(word)
    }
}
```
To fix this we need to group the elements inside the **HStack** together so we can apply our VoiceOver customization:
```
List(usedWords, id: \.self) { word in
    HStack {
        Image(systemName: "\(word.count).circle")
        Text(word)
    }
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("\(word), \(word.count) letters")
}
```
Alternatively, you could break that text up to have a hint as well as a label, like this:
```
HStack {
    Image(systemName: "\(word.count).circle")
    Text(word)
}
.accessibilityElement(children: .ignore)
.accessibilityLabel(word)
.accessibilityHint("\(word.count) letters")
```
Regardless of which you choose, if you try the game again you’ll hear it now reads “spill, five letters”, which is much better.