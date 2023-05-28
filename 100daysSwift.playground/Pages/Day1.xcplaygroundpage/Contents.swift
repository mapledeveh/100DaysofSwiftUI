import UIKit

let temp: Int = 16

func toFahrenheit(celciusDegree tempInCel: Int) {
    let temInFah: Int = tempInCel * 9 / 5 + 32
    print("\(tempInCel) degree in Celcius is \(temInFah) in Fahrenheit.")
}

toFahrenheit(celciusDegree: 16)
