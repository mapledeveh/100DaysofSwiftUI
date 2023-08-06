import Foundation
// if only care whether function works or not. No error details will be given
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 22) {
    print("User: \(user)")
}

let user = (try? getUser(id: 33)) ?? "Anonymous"
print(user)
