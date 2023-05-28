import Foundation

enum errorNum: Error {
    case badNum, noRoot
}

func checkNum(_ num: Int) throws {
    if num >= 10_000 || num <= 1 {
        throw errorNum.badNum
    }
}

func squareRoot(of num: Int) throws -> Int {
    var result: Int = num / 2
    var prev: Int = 0

    while result != prev {
        prev = result
        result = (num / prev + prev) / 2
    }

    if result * result != num {
        throw errorNum.noRoot
    } else {
        return result
    }
    
}

let testNum = 144

do {
    try checkNum(testNum)
    let rootNum = try squareRoot(of: testNum)
    print(rootNum)
} catch errorNum.badNum {
    print("out of bounds")
} catch errorNum.noRoot {
    print("no root")
}
