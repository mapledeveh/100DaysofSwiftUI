import Foundation

// structs: complex, custom data types
struct Album {
    let title: String
    let artist: String
    let year: Int

    func summary() {
        print("\(title) in \(year) by \(artist).")
    }
}

let red = Album(title: "Hello, hello!", artist: "Ronaldo", year: 2022)
let wings = Album(title: "Hey yo, what's up?", artist: "Jee Zee", year: 2021)

print(red.artist)
print(wings.title)
red.summary()
wings.summary()

struct Employee {
    let name: String
    var vacationRemaning: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaning > days {
            vacationRemaning -= days
            print("\(name) is going on vacation!")
            print("Days remaining: \(vacationRemaning)")
        } else {
            print("Oops! Not enough days remaining.")
        }
    }
}
//: if "name" is a constant and has a default value, argument "name" won't show up when call function
var milly = Employee(name: "Milly", vacationRemaning: 8)
milly.takeVacation(days: 6)
