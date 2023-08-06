import Foundation

//: properties and methods on the struct itself instead of an instance of the struct

struct School {
    var students = 100
    static var studentCount = 0
//    static var studentCount = students // this won't work because static properties can't access regular properties and methods
    var someCount = studentCount // this however regular properties and methods can access static properties and methods
    
    // not mutating needed here
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Peter Parker")
print(School.studentCount)

var testSchool = School()
print(testSchool.students)
print(testSchool.someCount)

// usage example of organizing data in program
struct AppData {
    static let version = "1.1 beta 3"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.canistel.ca"
}

AppData.version
AppData.homeURL

// usage example of storing example data for struct, enabling to see previews of layouts
struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "gnguyen", password: "h4ir2d@thr0ne")
}

print(Employee.example.username, Employee.example.password)

/*: Keywords
 - **self**: The current *value* of a struct
 - **Self**: The current *type* of struct
*/
