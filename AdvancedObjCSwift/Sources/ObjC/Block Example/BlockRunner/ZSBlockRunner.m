//
//  ZSBlockRunner.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ZSBlockRunner.h"
#import "NSBlock.h"
#import "NSBlock+Extension.h"

typedef void(^EmptyBlock)(void);

@implementation ZSBlockRunner

// iOS-Runtime-Headers:
// https://github.com/nst/iOS-Runtime-Headers/tree/d576a9cc197412e81aa87624b755e59b4f00e3cd/Frameworks/CoreFoundation.framework

- (void)sayHello {
  [^{
    NSLog(@"Hello");
  } repeat:3];
}

- (void)checkBlockTypes {
  id class;
  
  // NSStackBlock.
  //  If a block captures variables.
  int foo = 3;
  class = [^{
    NSLog(@"%d", foo + 1);
  } class];
  NSLog(@"%@", class);
  
  // NSMallocBlock.
  // If we send to a block copy message.
  class = [[^{
    NSLog(@"%d", foo + 1);
  } copy] class];
  NSLog(@"%@", class);

  // NSMallocBlock.
  // ARC helps us and sends to a block copy message.
  id block = ^{
    NSLog(@"%d", foo + 1);
  };
  class = [block class];
  NSLog(@"%@", class);
  
  // NSGlobalBlock.
  // If a block doesn't capture variables.
  class = [^{
  } class];
  NSLog(@"%@", class);
  
  // NSStackBlock.
  // Send NSStackBlock into a func.
  fooFunc(^{
    NSLog(@"%d", foo + 1);
  });
  
  // Addresses.
  NSObject *object = [NSObject new];
  NSLog(@"object %p, ptr object %p", object, &object);
  ^{
    NSLog(@"object %p, ptr object %p", object, &object);
  }();
  
  __block NSObject *__object = [NSObject new];
  NSLog(@"__block object %p, ptr __block object %p", __object, &__object);
  ^{
    NSLog(@"__block object %p, ptr __block object %p", __object, &__object);
    __object = [NSObject new];
    NSLog(@"Changing __object");
    NSLog(@"__block object %p, ptr __block object %p", __object, &__object);
  }();
}

void fooFunc(EmptyBlock block) {
  id class = [block class];
  NSLog(@"%@", class);
}

@end
