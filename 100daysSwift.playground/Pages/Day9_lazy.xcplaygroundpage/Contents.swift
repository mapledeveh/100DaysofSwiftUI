import UIKit

// create some properties only when they are needed

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    let name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var eddy = Person(name: "Edgar")
print(eddy)
