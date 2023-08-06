import Foundation

struct Car {
    let model: String
    let seats: Int
    private(set) var currentGear: Int = 1
    
    mutating func changeGear(to gear: Int) {
        if (1...10).contains(gear) { // also: 1...10 ~= gear // but .contains looks nicer
            currentGear = gear
            print("Now in gear: \(currentGear)")
        } else {
            print("Gear \(gear) can't be found! Still in gear \(currentGear)")
        }
    }
}

var hondaCivic = Car(model: "Honda Civic", seats: 4)
print("\(hondaCivic.model) has \(hondaCivic.seats) seats in gear \(hondaCivic.currentGear)")
hondaCivic.changeGear(to: 4)
hondaCivic.changeGear(to: 12)
//hondaCivic.currentGear = 5
