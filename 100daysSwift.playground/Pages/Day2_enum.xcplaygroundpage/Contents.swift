import UIKit

// demonstrate how bad it can be for errors to happen
var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "wednesday "

// enum to the rescue
enum Weekdays {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

var day = Weekdays.Monday
day = Weekdays.Tuesday
day = .Wednesday

