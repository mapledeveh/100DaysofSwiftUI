import Foundation

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func summary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func summary() {
        print("I actually work my ass off \(hours) hours a day.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let john = Developer(hours: 8)

let jane = Manager(hours: 7)

john.work()
john.summary()
jane.work()
jane.summary()

/*: **Keywords**
 - override: obvious
 - final: this class is infertile. no child classes will inherit nothing from this class. too poor to leave inheritance.
 */
