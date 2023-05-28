import Foundation

/*
func getRandomNumber() -> Int {
    Int.random(in: 1...6)
    
}

func getRandomBool() -> Bool {
    Bool.random ()
}
*/
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random ()
}

print (getRandomNumber() == getRandomNumber() )

