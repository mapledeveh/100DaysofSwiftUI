import UIKit

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Bang")


let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0
var rolls = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I got a \(roll)")
    rolls += 1
}

print("Critical hit after \(rolls) rolls!")
