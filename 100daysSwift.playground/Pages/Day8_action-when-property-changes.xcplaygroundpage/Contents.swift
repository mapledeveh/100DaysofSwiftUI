import Foundation

//: example with the last value change as intentional error/bug to demonstrate
// struct Game {
//     var score = 0
// }

// var game = Game()
// game.score += 10
// print("Score is now \(game.score)")
// game.score -= 3
// print ("Score is now \(game.score)")
// game.score += 1

struct Game {
    var score = 0 {
        // property observer
        didSet {
            print("Score is now \(score)")
        }
    }
}
var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue) meaning not yet set")
        }

        didSet {
            print("Now \(contacts.count) contacts")
            print("Old value was: \(oldValue) before it becomes now \(contacts)")
        }
    }
}

var app = App()
app.contacts.append("Adriana G")
app.contacts.append("Peter P")
app.contacts.append("Lex L")