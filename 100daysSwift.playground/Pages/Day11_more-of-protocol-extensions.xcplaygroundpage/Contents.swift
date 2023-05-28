import Foundation

//extension Int {
// Int, Double,... conform to Numeric protocol
extension Numeric {
//    func squared() -> Int {
//    can't return an Int if a number is Double
//    Self refers to the current type, self refers to the current value
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 6
wholeNumber.squared()

// Equatable the protocol swift uses for comparing
//struct User: Equatable {
//struct User: Equatable, Comparable {
// Comparable is built upon (conforms to) Equatable
struct User: Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
    let name: String
}

let user1 = User(name: "Danerys")
let user2 = User(name: "Rhaenera")
print(user1 == user2)
print(user1 != user2)
print(user1 > user2)
print(user1 >= user2)
print(user1 <= user2)
print(user1 < user2)
