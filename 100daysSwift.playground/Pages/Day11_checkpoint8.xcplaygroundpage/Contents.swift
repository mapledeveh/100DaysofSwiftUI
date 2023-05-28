import Foundation

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    
    func summary()
}

extension Building {
    func summary() {
        print("Cost to build is $\(cost). There are \(rooms) rooms and the real estate agent's name is \(estateAgent).")
    }
}

struct House: Building {
    let rooms: Int
    
    let cost: Int
    
    let estateAgent: String
    
    
}
struct Office: Building {
    let rooms: Int
    
    let cost: Int
    
    let estateAgent: String
    
    
}

let myHouse = House(rooms: 5, cost: 1_000_000, estateAgent: "Danny Cho")
myHouse.summary()
