//
//  AlpabetDecoder.playground
//  AdvancedObjCSwift
//
//  Created by Sergey Zapuhlyak on 16/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

import UIKit

var iterations: Int = 0

// Func recursively decodes alphabet ("1", "2" ... "26") with numbers using array of indexes at index.
//
func decode(with numbers: [String], using indexes: [[Int]], at index: Int) -> Set<[String]> {
  
  let decodeNext: ([String]?) -> Set<[String]> = { result in
    let index = index + 1
    if index < indexes.count {
      iterations += 1
      let next = decode(with: numbers, using: indexes, at: index)
      return result == nil ? next : Set([result!]).union(next)
    } else {
      return Set<[String]>()
    }
  }
  
  var result = [String]()
  let alphabet = "1"..<"27"
  var i: Int = 0
  while i < numbers.count {
    if indexes[index][i] == 1 {
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

// Func makes all combinations of indexes from [1, 1, .., 1] to [2, 2, .., 2]
//
func makeIndexes(_ count: Int) -> [[Int]] {
  let start = Array(repeating: 1, count: count)
  var result = [[Int]]()
  result.append(start)
  var startIndex = 0
  while true {
    var wasMutating = false
    var candidate = result[startIndex]
    for j in 0..<candidate.count {
      
      if candidate[j] == 1 {
        candidate[j] = 2
      } else if candidate[j] == 2 {
        candidate[j] = 1
      }
      if !result.contains(candidate) {
        result.append(candidate)
        wasMutating = true
      }
      candidate = result[startIndex]
    }
    startIndex += 1
    if !wasMutating {
      break
    }
  }
  let finish = Array(repeating: 2, count: count)
  if !result.contains(finish) {
    result.append(finish)
  }
  return result
}

// Func calls recursive func decode(with:using:at:) to decode alphabet.
//
func decode(_ string: String) -> Set<[String]> {
  let numbers = string.map { String($0) }
  let indexes = makeIndexes(numbers.count)
  return decode(with: numbers, using: indexes, at: 0)
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
