import Foundation
// add more functionalities to types
extension String {
    // naming convention: functions that return new values and leave old values in place
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // naming convention: functions that replace the values in place
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "    This string has some whitespaces at the beginning and the end     "
quote.trimmed()
print(quote)

let lyrics = """
When I was young, it seemed that life was so wonderful
A miracle, oh, it was beautiful, magical
And all the birds in the trees, well they'd be singing so happily
Oh, joyfully, oh, playfully watching me
But then they sent me away to teach me how to be sensible
Logical, oh, responsible, practical
Then they showed me a world where I could be so dependable
Oh, clinical, oh, intellectual, cynical
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pages: Int
    let readingHours: Int

// if we want a custom property, we'll need a custom initializer but that will break the default, automatic initilizer
//    init(title: String, pages: Int) {
//        self.title = title
//        self.pages = pages
//        self.readingHours = pages / 50
//    }
}

extension Book {
    init(title: String, pages: Int) {
        self.title = title
        self.pages = pages
        self.readingHours = pages / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pages: 1169, readingHours: 25) // this will throw an error if we had set the custom initializer inside the Book struct
let wheeloftime = Book(title: "Wheel of Time", pages: 4000) // now we can use the "default" value for the readingHour property
wheeloftime.readingHours
