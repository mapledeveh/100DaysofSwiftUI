import Foundation

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    // remember "number" optional, if has value, is now accessible as "number" from here
    print("Square of \(number) is \(number * number)")
}

/*
var myVar: Int? = 3

if let unwrapped = myVar {
    // Run if myVar has a value inside
    // unwrapped value "unwrapped" is only accessible within this scope
}

guard let unwrapped = myVar else {
    // Run if myVar doesn't have a value inside
}
// unwrapped value "unwrapped" is accessible outside of guard scope
*/


