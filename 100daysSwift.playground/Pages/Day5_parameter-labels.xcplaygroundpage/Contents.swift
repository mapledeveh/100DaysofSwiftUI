import Foundation

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

// swift allows defining different functions with the same name for different parameters
func hireEmplovee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see"))
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let stringTest = "HELLO, WORLD"
let result = isUppercase(stringTest)

func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable(for: 5)
