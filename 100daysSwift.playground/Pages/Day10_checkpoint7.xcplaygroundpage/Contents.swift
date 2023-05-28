import Foundation

class Animal {
    let legs: Int
    
    init(legs: Int = 4) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof, woof, woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Yap, yap, yap!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bow, wow, wow!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int = 4, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow, meow, meow!")
    }
}

class Persion: Cat {
    override func speak() {
        print("Grrrr!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar, roar, roar!")
    }
}

let milly = Poodle()
milly.legs
milly.speak()
let tom = Cat(isTame: true)
tom.legs
tom.speak()
