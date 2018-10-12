//
//  ZSRunTimeRunner.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ZSRunTimeRunner.h"
#import "SwizzlableObject.h"
#import "ExtendedSwizzlableObject.h"
#import <objc/runtime.h>

@implementation ZSRunTimeRunner

- (void)swizzleObject {
  SwizzlableObject *object = [SwizzlableObject new];
  [object sayHello];
  [object sayGoodbye];
  
  [object swizzling];
  
  [object sayHello];
  [object sayGoodbye];
}

- (void)changeIsa {
  SwizzlableObject *object = [SwizzlableObject new];
  [object sayHello];
  [object sayGoodbye];
  NSLog(@"Class of object = %@", [object class]);
  
  object_setClass(object, [ExtendedSwizzlableObject class]);
  
  NSLog(@"Class of object = %@", [object class]);
  [object performSelector:@selector(setIntro:) withObject:@"Hi"];
  [object performSelector:@selector(say:) withObject:@"@zsergey"];
  
  // It's valid now.
  ExtendedSwizzlableObject* extObject = (ExtendedSwizzlableObject *)object;
  extObject.intro = @"Bye";
  
  // Print all methods of classes.
  Class extObjectClass = [extObject class];
  NSLog(@"Methods of ExtendedSwizzlableObject:");
  printMethods(extObjectClass);
  
  Class metaClass = object_getClass(extObjectClass);
  NSLog(@"Methods of meta class of ExtendedSwizzlableObject:");
  printMethods(metaClass);
  
  NSLog(@"All classes are:\n%@", [[extObject class] allClasses]);
}

void printMethods(Class class) {
  unsigned int count;
  Method *methods = class_copyMethodList(class, &count);
  for (int i = 0; i < count; i++) {
    Method method = methods[i];
    SEL selector = method_getName(method);
    NSLog(@"%@", NSStringFromSelector(selector));
  }
}

@end
