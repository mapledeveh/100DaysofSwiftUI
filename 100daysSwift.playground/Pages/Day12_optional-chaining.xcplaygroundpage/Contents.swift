import Foundation

let names = [ "Arya", "Bran", "Rob", "Sansa", "Rickon" ]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// example for placing books in alphabetical order based on their author names
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "69"
print(author)
