import Foundation

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...100)
    }
}
// "memberwise initializer" by default. lose it if use custom initializer like above
// let player = Player(name: "Megan F", number: 15)
let player = Player(name: "Megan F")
print(player.number)