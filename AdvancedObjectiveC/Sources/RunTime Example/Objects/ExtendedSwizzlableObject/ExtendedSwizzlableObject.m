//
//  ExtendedSwizzlableObject.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ExtendedSwizzlableObject.h"

@implementation ExtendedSwizzlableObject

+ (NSArray <Class> *)allClasses {
  NSMutableArray <Class> * result = [NSMutableArray <Class> new];
  [result addObject:[SwizzlableObject class]];
  [result addObject:[ExtendedSwizzlableObject class]];
  return result;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _intro = @"Say";
  }
  return self;
}

- (void)say:(NSString *)text {
  NSLog(@"%@ %@", self.intro, text);
}

@end
