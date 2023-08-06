import UIKit

// array

var musicalUKBand = ["John", "Paul", "George", "Philip"]
let numericalGroup = [3, 5, 1, 66, 93]

musicalUKBand.append("Alex")

var scores = Array<Int>()
scores.append(100)
scores.append(22)
scores.append(65)
print(scores)

// var albums = [String]
// var albums = ["Country"]
var albums = Array<String>()
albums.append("Country")
albums.append("Rock&Roll")
albums.append("Pop")
albums.append("Classical")
print(albums[2])
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

let bondMovies = ["Casino Royal", "Spectre", "No Time to Die"]
print(bondMovies.contains("John Wick"))

let cities = ["Toronto", "Vancouver", "Calgary", "New York"]
print(cities.sorted(), cities)

// swift is sneaky here
let primeMinisters = ["Justin Trudeau", "Stephen Harper", "Paul Martin", "Jean Chrétien"]
let reversePrimeMinisters = primeMinisters.reversed()
print(reversePrimeMinisters)
print(reversePrimeMinisters.count)

