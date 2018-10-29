import UIKit

func decode(_ string: String) -> Int {
  let alphabet = 1..<27
  let string = string.map { String($0) }
  var fact: (([String], Int, Int) -> Int)?
  fact = { numbers, index, count in
    guard index < numbers.count else { return 0 }
    var value = numbers[index]
    if count == 2 {
      guard index + 1 < numbers.count else { return 0 }
      value += numbers[index + 1]
    }
    guard alphabet.contains(Int(value)!) else { return 0 }
    return index == numbers.count - count ? 1 : fact!(numbers, index + count, 1) + fact!(numbers, index + count, 2)
  }
  return fact!(string, 0, 1) + fact!(string, 0, 2)
}

// Using.
//
let string = "1235321"
let result = decode(string)

print("Decode string: \"\(string)\"")
print("Number of ways to decode the string: \(result)")
