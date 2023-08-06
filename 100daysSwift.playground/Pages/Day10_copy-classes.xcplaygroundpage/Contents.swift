import Foundation

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1

user2.username = "Michael"
print(user1.username)
print(user2.username)

// deep copy, make a unique copy of the class instance, handle creating a new instance then copy across properties by hand
class Member {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user3 = Member()
var user4 = user3.copy()
user4.username = "Zach"
print(user3.username)
print(user4.username)
