import UIKit

func make(_ nums: [Int], _ target: Int) -> Int {
  var dict = [Int: Int]()
  for num in nums {
    let value = num + target
    dict[value] = 1
  }
  var result = 0
  for num in nums {
    result += dict[num] ?? 0
  }
  return result
}

// Using.
//
var nums = [2, 4, 6, 8, 10, 12]
let target = 2
let result = make(nums, target)
print("result = \(result)")
