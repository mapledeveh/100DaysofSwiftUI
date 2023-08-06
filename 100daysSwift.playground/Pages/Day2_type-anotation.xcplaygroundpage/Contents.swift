import UIKit

var albums: [String] = ["Red", "Blue"]
var user: [String: String] = ["id": "@alxvngn"]
var books: Set<String> = Set(["And then there were none", "Charlote's Web"])

var pop: [String] = ["Coke", "Pepsi", "Red Bull"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()


enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
// var style: UIStyle = UIStyle.light
style = .dark
// style = UIStyle.dark

let username: String
// some logic
username = "@alxvngn"
// some more logic
//username = "new name" // throws an error
print(username)

// let scores: Int = "Zero" // throws an error
