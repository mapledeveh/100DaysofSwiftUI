import UIKit

// sets are like array but unordered and no duplicate items
var musicalUKBand = Set(["John", "Paul", "George", "Philip"])
print(musicalUKBand)

let greetings = ["Hello", "Hi", "Bonjour", "Hej", "Xin Chào"]
let welcome = Set(greetings)
print(welcome)

// add a new item by using .insert
var blankSetHere = Set<String>()
blankSetHere.insert("What's up")
blankSetHere.insert("Ayo")
print(blankSetHere)
