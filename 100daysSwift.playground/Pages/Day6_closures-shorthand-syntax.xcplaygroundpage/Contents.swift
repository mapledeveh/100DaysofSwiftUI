import Foundation

func greetUser() {
    print ("Hi there!")
}

greetUser()
var greetCopy = greetUser
// var greetCopy: () -> String = greetUser
greetCopy()

func getUserData(for id: Int) -> String {
    if id == 1986 {
        return "Maria Ozawa"
    } else {
        return "Nobody"
    }
}

let data: (Int) -> String = getUserData
let user = data(1986)
print(user)

let sayHello = { (name: String) -> String in "Hi \(name)" }
sayHello("Rie Tachikawa")

let team = ["George", "Samantha", "Philip", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Samantha" {
        return true
    } else if name2 == "Samantha" {
        return false
    }
    return name1 < name2
}

//: pass in a function
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


//: pass in the content of that function

//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Samantha" {
//        return true
//    } else if name2 == "Samantha" {
//        return false
//    }
//    return name1 < name2
//})

//: shorthand for the arguments

//let captainFirstTeam = team.sorted(by: { (name1, name2) in
//    if name1 == "Samantha" {
//        return true
//    } else if name2 == "Samantha" {
//        return false
//    }
//    return name1 < name2
//})

//: using closure's first and second shorthand argument names
//let captainFirstTeam = team.sorted {
//    if $0 == "Samantha" {
//        return true
//    } else if $1 == "Samantha" {
//        return false
//    }
//    return $0 < $1
//}

//: no need for the whole thing. Mind the reversed operator. this time only to reverse sort and not put "Samantha" on top
//let reverseTeam = team.sorted {
//    return $0 > $1
//}
//: no need for return this time
let reverseTeam = team.sorted { $0 > $1 }

//print(captainFirstTeam)
print(reverseTeam)
