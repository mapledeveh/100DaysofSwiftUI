import UIKit

func showWelcome() {
    print ("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139
if number.isMultiple(of: 2) {
    print ("Even")
} else {
    print ("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)
