import Foundation

let team = ["George", "Samantha", "Philip", "Tiffany", "Tess"]

// run a test on every item in an array and return an array with items that passed the test
let startWithT = team.filter { $0.hasPrefix("T") }
print(startWithT)

// transform every item in an array
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
