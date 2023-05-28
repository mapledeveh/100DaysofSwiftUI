import UIKit

// using an array to demonstrate how better a dictionary is in this particular use
let employee = ["Shawn Mendes", "Singer", "Canada"]
print("Name: \(employee[0])")
print("Job: \(employee[1])")
print("Country: \(employee[2])")

let employee2 = ["name":"Shawn Mendes", "job":"Singer", "country":"Canada"]
// Optional kind of situation
print(employee2["name"])
print(employee2["job"])
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
// non existent key
print(employee2["home", default: "Unknown"])

// different types of data
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "O'Neill": false
]
print(hasGraduated["Eric"]!) // forced unwrap because I'm lazy

let olympics = [
    2012: "London",
    2008: "Beijing",
    2021: "Tokyo",
    2014: "Vancouver",
]

print(olympics[2014, default: "Nowhere"])

// initiate an empty dictionary with string for keys and int for values
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["LeBron James"] = 206

// overwrite value
var archEnemies = [String: String]()
archEnemies["Batman"] = "Joker"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies["Batman"]!) // forced unwrap again
archEnemies["Batman"] = "Penguin"
print(archEnemies["Batman"]!) // for the sake of laziness
