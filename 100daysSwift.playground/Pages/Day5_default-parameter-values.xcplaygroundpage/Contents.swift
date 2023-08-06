import Foundation

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number) ")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


var characters = ["Lana", "Pam", "Ray", "Sterling" ]
print(characters.count)
characters.removeAll(keepingCapacity: true) // this will keep the array able to hold 4 items in the future(?) more of a memory thing
print(characters.count)
