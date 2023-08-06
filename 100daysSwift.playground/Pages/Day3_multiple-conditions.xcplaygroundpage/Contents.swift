import UIKit

let age = 16

if age >= 18 {
    print( "You can vote in the next election.")
}
if age < 18 {
    print("Sorry, you're too young to vote.")
}

let a = false
let b = false

if a {
    print ("Code to run if a is true")
} else if b {
    print ("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25
if temp > 20 && temp < 30 {
    print ("It's a nice day.")
}

let userAge = 14
var hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy this game.")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, bus
}

let transport = TransportOption.bus

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike lane.")
} else if transport == .car {
    print("Brace for traffic.")
} else {
    print("TTC sucks.")
}
