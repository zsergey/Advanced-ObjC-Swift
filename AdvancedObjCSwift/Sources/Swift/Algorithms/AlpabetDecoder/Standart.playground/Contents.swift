//
//  AlpabetDecoder.playground
//  AdvancedObjCSwift
//
//  Created by Sergey Zapuhlyak on 16/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

import UIKit

var iterations: Int = 0

// Extension to able to get substring of String by index.
//
public extension String {
  subscript(short: Int) -> Character {
    get {
      return self[index(startIndex, offsetBy: short)]
    }
  }
}

// Func makes string with length equal count that contains representation of index in binary format.
//
func makeBits(_ index: Int, _ count: Int) -> String {
  var string = String(index, radix: 2)
  string = String(repeating: "0", count: count - string.count) + string
  return string
}

// Func recursively decodes alphabet ("1", "2" ... "26") with numbers using array of indexes at index.
//
func decode(with numbers: [String], at index: Int, max maxValue: Int) -> Set<[String]> {

  let decodeNext: ([String]?) -> Set<[String]> = { result in
    let index = index + 1
    if index < maxValue {
      iterations += 1
      let next = decode(with: numbers, at: index, max: maxValue)
      return result == nil ? next : Set([result!]).union(next)
    } else {
      return Set<[String]>()
    }
  }

  var result = [String]()
  let alphabet = "1"..<"27"
  var i: Int = 0
  let bits = makeBits(index, numbers.count)
  while i < numbers.count {
    if bits[i] == "0" {
      result.append(numbers[i])
      i += 1
    } else {
      let first = numbers[i]
      let second = (i + 1 < numbers.count) ? numbers[i + 1] : ""
      let value = first + second
      if alphabet.contains(value)  {
        result.append(value)
      } else {
        return decodeNext(nil)
      }
      i += 2
    }
  }
  return decodeNext(result)
}

// Func calls recursive func decode(with:using:at:) to decode alphabet.
//
func decode(_ string: String) -> Set<[String]> {
  let numbers = string.map { String($0) }
  let maxValue = Int(pow(2.0, Float(numbers.count)))
  return decode(with: numbers, at: 0, max: maxValue)
}

// Using.
//
iterations = 0
let string = "1235321"
let result = decode(string)

print("Decode string: \"\(string)\"")
print(result)

print("Iterations: \(iterations)")
print("Number of ways to decode the string: \(result.count)")

