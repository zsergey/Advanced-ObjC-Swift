import UIKit

func decode(_ string: String) -> Int {
  let string = string.map { String($0) }
  let alphabet = 1..<27
  var cache = [Int: Int]()
  var fact:(([String], Int) -> Int)?
  
  fact = { numbers, index in
    guard index < numbers.count else { return 1 }
    
    if let result = cache[index] {
      return result
    }
    
    var result2 = 0
    let value = numbers[index]
    if index + 1 < numbers.count {
      let value2 = value + numbers[index + 1]
      if alphabet.contains(Int(value2)!) {
        result2 = fact!(numbers, index + 2)
      }
    }
    
    let result1 = fact!(numbers, index + 1)
    let result = result1 + result2
    cache[index] = result
    return result
  }
  
  return fact!(string, 0)
}

// Using.
//
let strings = ["1235321", String(repeating: "1", count: 80)]
for string in strings {
  let result = decode(string)
  
  print("Decode string: \"\(string)\"")
  print("Number of ways to decode the string: \(result)")
}
