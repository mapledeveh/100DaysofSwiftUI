import UIKit

let filenames = ["me.jpg", "work.txt", "code.js", "gaby.jpg", "maia.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue // carry on to the next iteration and skip the rest of the loop body
    }
    print("Found picture: \(filename)")
}

let number1 = 5
let number2 = 12
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
    }
    // stops after getting 10 items maximum
    if multiples.count == 10 {
        break // break or abandon the whole loop and move on
    }
}
print(multiples)
