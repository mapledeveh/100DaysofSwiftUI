import Foundation

let captains = [ "Orville": "Ed Mercer", "Jolly Roger": "Hook", "Gauntlet": "Bo-Katan Kryze" ]

// ?? gives a default value if nil
let new = captains["Prometheus"] ?? "N/A"

let tvShows = ["The Boys", "The Mandalorian", "Stargate: SG-1"]
let favourite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Who Ate My Cheese?", author: nil)
let author = book.author ?? "Unknown"
print(author)

let input = ""
let number = Int(input) ?? 0
print(number)
