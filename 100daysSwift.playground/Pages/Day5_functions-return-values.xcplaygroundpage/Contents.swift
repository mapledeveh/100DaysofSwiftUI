import Foundation

let root = sqrt(144)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func haveSameLetters(string1: String, string2: String) -> Bool {
//    if string1.sorted() == string2.sorted() {
//       return true
//    } else {
//        return false
//    }
    return string1.sorted() == string2.sorted()
}

let this = "live"
let that = "hahaha"

haveSameLetters(string1: this, string2: that) ? print("Yes") : print("No")

func pythagoras(a: Double, b: Double) -> Double {
    return sqrt(a * a + b * b)
}

print(pythagoras(a: 5, b: 7))

//: #### *return* without a value works like break for loops
