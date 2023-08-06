import Foundation

enum PasswordError: Error {

    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let usrPwd = "1234"

do {
    let result = try checkPassword(usrPwd)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Too short. Make it longer.")
} catch PasswordError.obvious {
    print("Too easy. Make it harder.")
} catch {
    print("There was an error with this password. \(error.localizedDescription)")
}