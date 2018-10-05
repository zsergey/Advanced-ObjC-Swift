//
//  ZSThreadSafeProxy.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 9/30/18.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ZSThreadSafeProxy.h"

@interface ZSThreadSafeProxy()
@property (strong, nonatomic) id <NSLocking> lock;
@end

@implementation ZSThreadSafeProxy

#pragma mark -
#pragma mark Initialization & Deallocation

- (id)initWithTarget:(id)target
{
  self = [super initWithTarget:target];
  if (self) {
    _lock = [NSLock new];
  }
  return self;
}

#pragma mark -
#pragma mark Forwarding

- (void)forwardInvocation:(NSInvocation *)invocation {
  id <NSLocking> lock = self.lock;
  [lock lock];
  [invocation invokeWithTarget:self.target];
  [lock unlock];
}

@end
