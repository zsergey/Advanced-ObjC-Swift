//
//  NSBlock+Extension.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "NSBlock+Extension.h"

@implementation NSBlock (Extension)

- (void)repeat:(NSUInteger)count {
  for (int i = 0; i < count; i++) {
    [(NSBlock *)self invoke];
  }
}

@end
