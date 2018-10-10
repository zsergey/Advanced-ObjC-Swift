//
//  SwizzlableObject.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "SwizzlableObject.h"
#import <objc/runtime.h>

@implementation SwizzlableObject

- (void)sayHello {
  NSLog(@"Say Hello");
}

- (void)sayGoodbye {
  NSLog(@"Say Goodbye");
}

- (void)swizzling {
  Method sayHelloMethod = class_getInstanceMethod([self class], @selector(sayHello));
  Method sayGoodbyeMethod = class_getInstanceMethod([self class], @selector(sayGoodbye));
  method_exchangeImplementations(sayHelloMethod, sayGoodbyeMethod);
}

@end
