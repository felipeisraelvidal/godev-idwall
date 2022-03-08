import UIKit
import Foundation

// MARK: - Types

MemoryLayout<Int8>.size // 1 byte (-128 and 127)
MemoryLayout<Int8>.alignment
MemoryLayout<Int8>.stride

MemoryLayout<Int16>.size // 2 bytes (-32.768 and 32.767)
MemoryLayout<Int16>.alignment
MemoryLayout<Int16>.stride

MemoryLayout<Int32>.size // 4 bytes (-2.147.483.648 and 2.147.483.647)
MemoryLayout<Int32>.alignment
MemoryLayout<Int32>.stride

MemoryLayout<Int64>.size // 8 bytes (-9.223.372.036.854.775.808 and 9.223.372.036.854.775.807)
MemoryLayout<Int64>.alignment
MemoryLayout<Int64>.stride

// On 32-bit platforms, Int is the same size of Int32
// In 64-bit platforms, Int is the same size of Int64
MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride

// MARK: Float (4 bytes)
// Float variables can only hold seven digits of precision

MemoryLayout<Float>.size
MemoryLayout<Float>.alignment
MemoryLayout<Float>.stride

let floatValue: Float = 3.5
print(floatValue)

// MARK: Double (8 bytes)
// Double can contain twice as much precision as Float

MemoryLayout<Double>.size
MemoryLayout<Double>.alignment
MemoryLayout<Double>.stride

let doubleValue: Float = 3.5
print(doubleValue)

// MARK: String (16 bytes)

MemoryLayout<String>.size
MemoryLayout<String>.alignment
MemoryLayout<String>.stride

let stringValue: String = "Felipe Vidal"
print(stringValue)

// MARK: Char (16 bytes)

MemoryLayout<Character>.size
MemoryLayout<Character>.alignment
MemoryLayout<Character>.stride

let charValue: Character = "f"
print(charValue)

// MARK: Bool (1 byte)

MemoryLayout<Bool>.size
MemoryLayout<Bool>.alignment
MemoryLayout<Bool>.stride

let boolValue: Bool = false
print(boolValue)

// MARK: - Data Collections

var cars = ["Fusca", "Ferrari", "Audi A3", "Celta", "Marea Turbo"]
print(cars)

cars.append("Gol") // Insert at the end of array
print(cars)

cars.insert("HB20", at: 0) // Insert at position 0 of the array
print(cars)

var numbers = [1, 2, 3, 4, 5]

// MARK: - Dictionary

var dict: [String : String] = [
    "name": "Felipe Vidal",
    "email": "felipeisra.vidal@gmail.com"
]

print(dict["name"] ?? "No name")
print(dict["email"] ?? "No email")

var users: [[String : Any]] = [
    [
        "name": "Felipe Vidal",
        "email": "felipeisra.vidal@gmail.com",
        "age": 21
    ]
]

print(users[0]["age"] ?? "No age found")

// MARK: - Operators

/*:
 
 - Atribuição: =
 - Comparação: ==
 - Diferente de: !=
 - Menor: <
 - Menor ou igual a: <=
 - Maior: >
 - Maior ou igual a: >=
 
*/

let num1 = 10
let num2 = 20

let compair1 = num1 > num2
print(compair1) // false

let name = "Felipe"
let lastName = "Vidal"

let compair2 = name < lastName
print(compair2) // true

// MARK: - Expressions

/*:
 
 - Negação: !
 - E: &&
 - Ou: ||
 
*/

let isHidden = false
let isEnabled = true

print(isHidden || isEnabled) // true
print(isHidden && isEnabled) // false

// MARK: - Conditional
