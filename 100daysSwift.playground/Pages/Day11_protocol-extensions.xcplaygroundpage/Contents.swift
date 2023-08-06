import Foundation

// protocol oriented programming
//extension Array { // Array, Dictionary, Set,... conform to protocol Collection
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

var guests = ["Mario", "Lugi", "Bowser"]

if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}
guests.removeAll()
guests.isNotEmpty ? print("Count: \(guests.count)") : print("Meh")

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name).")
    }
}

struct Assassin: Person {
    let name: String
}

let john = Assassin(name: "John Wick")
john.sayHello()
