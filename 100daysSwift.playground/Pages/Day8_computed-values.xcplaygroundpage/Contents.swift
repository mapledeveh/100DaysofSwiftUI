import Foundation

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaning: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var milly = Employee(name: "Milly", vacationAllocated: 15)
milly.vacationTaken += 4
print(milly.vacationRemaning) // default with 14 allocated

// update allocated value through other 2
milly.vacationTaken += 4
milly.vacationRemaning = 5
print(milly.vacationAllocated)
