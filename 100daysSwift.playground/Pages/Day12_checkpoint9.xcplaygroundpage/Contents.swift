import Foundation

func acceptOptions(in array: [Int]?) -> Int { array?.randomElement() ?? Int.random(in: 1...100) }

let aHa: [Int] = []
print(acceptOptions(in: aHa))
