//
//  ZSProxyFactory.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 05/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ZSProxyFactory.h"
#import "ZSThreadSafeProxy.h"

@implementation ZSProxyFactory

+ (void)makeProxy {
  NSMutableArray *array = [NSMutableArray new];
  id object = [ZSThreadSafeProxy proxyWithTarget:array];
  [object addObject:@"Sergey"];
  [object addObject:@"Zapuhlyak"];
  NSLog(@"%@ array", array);
}

@end
