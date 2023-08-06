import Foundation

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

//: my own way

let noEven = { (anArray: [Int]) -> [Int] in
    let oddArray = anArray.filter { !$0.isMultiple(of: 2) }
    return oddArray.sorted()
}

//print(noEven(luckyNumbers))

func showResult(from someArray: [Int], thru someFunc: ([Int]) -> [Int]) -> Void {
    let tempArray = someFunc(someArray)
    for i in 0..<tempArray.count { print("\(tempArray[i]) is a lucky number") }
}

showResult(from: luckyNumbers, thru: noEven)

//: instructor's inspiration

luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted().map { print("\($0) is a lucky number") }
