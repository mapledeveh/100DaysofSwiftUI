import Foundation

struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var myAccount = BankAccount()
myAccount.deposit(amount: 100)

let success = myAccount.withdraw(amount: 200)

success ? print("Withdrew") : print("Failed")

myAccount.funds -= 1000
// this property is exposed and therefore can be modified directly which shouldn't be in this example


struct BankAccountFix {
    // tell swift that this property is only avaialble for reading and writing inside this struct
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var myAccountFix = BankAccountFix()
myAccountFix.deposit(amount: 100)

let successFix = myAccountFix.withdraw(amount: 200)

successFix ? print("Withdrew") : print("Failed")

// this will run with private(set) and throw an "inaccessible" error with private
print(myAccountFix.funds)
// this will throw an "inaccessible" error with private and private(set)
//myAccountFix.funds -= 1000

/*: Keywords
 - **private**: Don't let anything outside the struct use this
 - **fileprivate**: Don't let anything outside the current file use this
 - **public**: Let anyone, anywhere use this
 - **public(set)**: Let anyone read this property internally and externally but only my internal methods write it
*/
