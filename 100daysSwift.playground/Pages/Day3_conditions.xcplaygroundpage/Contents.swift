import UIKit

let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You are eligible to vote.")
}

let ourFriend = "Dave Bautista"
let theirFriend = "Arnold Swanegzer"

if ourFriend < theirFriend {
    print("It's \(ourFriend) vs \(theirFriend)")
}

if ourFriend > theirFriend {
    print("It's \(theirFriend) vs \(ourFriend)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"
if  country == "Australia" {
    print("G'day!")
}

let name = "Shawn Mendes"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var username = "shawnmendes123"

// ways of doing this check
// if username == "" { // most common but not very great
// if username.count == 0 { // again, common but terible perfomance
if username.isEmpty { // best way to do
    username = "Anonymous"
}

print("Welcome, \(username)")
