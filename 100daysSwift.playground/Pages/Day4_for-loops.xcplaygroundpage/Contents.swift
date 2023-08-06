import UIKit

let platforms = ["iOS", "macOS", "ipadOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...13 {
    print("The \(i) times table")
    
    for j in 1...13 {
        print("   \(j) x \(i) is \(j * i)")
    }
    print() // print an empty line
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "An angry man's cursing"

for _ in 1...5 {
    lyric += " shiet"
}
print(lyric)
