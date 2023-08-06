import Foundation

func greetUser() {
    print("Hi there!")
}
greetUser()
var greetCopy: () -> Void = greetUser
greetCopy()

//: prepare a function to use as parameter later
func generateNum() -> Int { Int.random(in: 1...20) }

//: this function takes a function as one of its arguments
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let num = generator()
        numbers.append(num)
    }
    
    return numbers
}

let newRoll = makeArray(size: 40, using: generateNum)
print(newRoll)

//: this function takes 3 functions as parameters
func doSomething(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("Start first.")
    first()
    print("Start second")
    second()
    print("Start third")
    third()
    print("Done!")
}
//: using print() as parameters for this example. feel free to write different functions 
doSomething {
    print("This is first")
} second: {
    print("This is second")
} third: {
    print("This is third")
}
