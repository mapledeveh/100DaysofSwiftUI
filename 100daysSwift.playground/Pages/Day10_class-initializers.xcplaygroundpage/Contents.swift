import Foundation

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    // must add isElectric from Vehicle (parent) class here
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        // super is like self (swift provided) keyword, used to call up to methods inherited from parent classes
        super.init(isElectric: isElectric)
    }
}

let tesla3 = Car(isElectric: true, isConvertible: false)
tesla3.isConvertible
