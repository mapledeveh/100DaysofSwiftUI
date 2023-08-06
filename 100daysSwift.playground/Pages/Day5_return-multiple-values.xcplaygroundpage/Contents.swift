import Foundation

// using array - not goot
func getUserArray() -> [String] {
    ["Taylor", "Swift"]
}

let userArray = getUserArray()
print ("NameArray: \(userArray[0]) \(userArray[1])")

// using dictionary - not good
func getUserDic() -> [String: String] {
    ["firstName": "Tavlor", "lastName":"Swift"]
}

let userDic = getUserDic()
print("NameDic: \(userDic["firstName", default: "?"]) \(userDic["lastName", default: "?"])")

// using tuple - good
func getUserTup() -> (firstName: String, lastName: String) {
    (firstName:"Alex", lastName:"Nguyen")
    // ("Alex", "Nguyen") // swift know the names of the values inside this tuple, it's in your return type, so no need to repeat
}

func getUserTupByIndex() -> (String, String) { // tuples have index like array but swift knows that there's values, unlike array
    ("Alex", "Nguyen")
    // ("Alex", "Nguyen") // swift know the names of the values inside this tuple, it's in your return type, so no need to repeat
}

let userTup = getUserTup()
print("NameTup: \(userTup.firstName) \(userTup.lastName)")
print("NameTup: \(userTup.0) \(userTup.1)") // this works too

let userTupNoname = getUserTupByIndex()
print("NameTupByIndex: \(userTupNoname.0) \(userTupNoname.1)")

// tinkering with tuples
let testTuple = ("Hi", "Hello", "Hey", "Yo")
print(testTuple.2, testTuple.3)
let (one, two) = getUserTup()
print(two, one)
let (onlyOne, _) = getUserTupByIndex()
print(onlyOne)
/*:
* Swift can't know ahead of time if dictionary keys are present.
* When you access tuple values, Swift knows it will be there.
* We access values using user.firstName, not a string.
* Dictionary might contain hundreds of other values.
*/
