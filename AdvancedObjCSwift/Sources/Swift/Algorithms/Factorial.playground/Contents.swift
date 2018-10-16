//
//  Factorial.playground
//  AdvancedObjCSwift
//
//  Created by Sergey Zapuhlyak on 12/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

import UIKit

// Func calculates factorial from max number in number.
//
func fact(_ n: Int) -> Int {
  return n > 0 ? max(n%10 * fact(n%10 - 1), fact(n / 10)) : 1
}

fact(1035)

