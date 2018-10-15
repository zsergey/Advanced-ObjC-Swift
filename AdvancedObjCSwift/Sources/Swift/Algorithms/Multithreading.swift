//
//  Multithreading.swift
//  AdvancedObjCSwift
//
//  Created by Sergey Zapuhlyak on 15/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

import Foundation

// Sample of Multithreading from MBLTDEV.
// This code prints:
// 1
// 3
//
func runInQueues() {
  var result = 0
  let group = DispatchGroup()
  DispatchQueue.global().sync {
    DispatchQueue.main.async {
      result = 1
      DispatchQueue.global().async { [toPrint = result] in
        DispatchQueue.main.async {
          result = 2
          group.leave()
          result = 3
        }
        print(toPrint)
      }
    }
  }
  group.enter()
  group.notify(queue: .main) { print(result) }
}
