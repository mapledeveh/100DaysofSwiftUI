import UIKit

// parenthasis are optional (not to confuse with Optionals
let age = 18
let canVote = (age >= 18) ? "Yes" : "No"
print(canVote)

// only tertinary operator can be used in a print statement, not if-else
let hour = 23
print (hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print (crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.light
let background = theme == .dark ? "black" : "white"
print (background)
