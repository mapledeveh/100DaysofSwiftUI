import Foundation
/*:
 Type casting lets us tell Swift that an object it thinks is type A is actually type B, which is helpful when working with protocols and class inheritance.

 As you’ve seen, protocols let us group together common functionality so we can share code. However, some times we need to go in the opposite direction – we need to be able to see “you have an object that conforms to a protocol, but I’d like you to let me use it as a specific type.”
 */
class Person {
    var name = "Anonymous"
}

class Customer: Person {
    var id = 12345
}

class Employee: Person {
    var salary = 50_000
}

let customer = Customer()
let employee = Employee()
let people = [customer, employee]
/*:
 Because both Customer and Employee inherit from Person, Swift will consider that people constant to be a Person array. So, if we loop over people we’ll only be able to access the name of each item in the array – or at least we would only be able to do that, if it weren’t for type casting:
 */
for person in people {
    if let customer = person as? Customer {
        print("I'm a customer, with id \(customer.id)")
    } else if let employee = person as? Employee {
        print("I'm an employee, earning $\(employee.salary)")
    }
}
/*:
 As you can see, that attempts to convert person first to Customer and then to Employee. If either test passes, we can then use the extra properties that belong to that class, as well as the name property from the parent class.

 Type casting isn’t specifically frowned upon in Swift, but I would say that repeated type casting might mean you’ve got an underlying problem in your code. More specifically, Swift works best when it understands what data you’re working with, and a type cast effectively says to Swift, “I know more information than you do.” If you can find ways to convey that information to Swift so it understand it as well, that usually works better.
 */
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]
/*:
 Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal.

 If we want to loop over the pets array and ask all the dogs to bark, we need to perform a typecast: Swift will check to see whether each pet is a Dog object, and if it is we can then call makeNoise().

 This uses a new keyword called as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise.
 */
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
