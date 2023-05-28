import Foundation

protocol Vehicle {
    var name: String { get } // readable
    var currentPassengers: Int { get set } // readable and writable
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol BeElectric {
    var isElectric: Bool { get }
}

// conform to multiple protocols
struct Car: Vehicle, BeElectric {
    var isElectric = false
    
    var name = "Vroom Vroom"
    
    var currentPassengers = 5
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's sunny!")
    }
}

struct Bike: Vehicle {
    var name = "Bicycle"
    
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling for \(distance) km.")
    }
}

//func commute(distance: Int, vehicle: Car) {
func commute(distance: Int, vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow! Take a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelETA(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
car.currentPassengers
car.isElectric
commute(distance: 100, vehicle: car)
let bike = Bike()
bike.name
commute(distance: 50, vehicle: bike)

getTravelETA(using: [car, bike], distance: 200)
