//
//  Digits.playground
//  AdvancedObjCSwift
//
//  Created by Sergey Zapuhlyak on 12/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

import UIKit

// Func makes all combinations with characters from buttons of iPhone by a string with numbers.
//
func words(_ digits: String) -> [String] {
  return digits.reduce([""]){
    var r = [String]()
    for e in $0 {
      _ = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"][Int("\($1)")! - 2].map{ r += [e + "\($0)"] }
    }
    return r
    }.filter{ $0 != "" }
}

words("234")
