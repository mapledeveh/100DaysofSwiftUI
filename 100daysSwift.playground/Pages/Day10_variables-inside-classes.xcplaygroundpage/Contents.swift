import Foundation

class User {
    var name = "Paul"
}

//let user = User()
var user = User()
user.name = "Tiffany"
print(user.name)
user = User() // this won't work if user was a constant
print(user.name)
/*:
 - Constant class, constant property: Signpost that always points to the same user, who always has the same name
 - Variable class, constant property: Signpost that can point to different users, but their names never change
 - Constant class, variable property: Signpost that always points to the same user, but their name can change
 - Variable class, variable property: Signpost that can point to different users, and those users can also change their names.
*/
