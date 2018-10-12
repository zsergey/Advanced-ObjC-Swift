//
//  ZSProxy.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 9/30/18.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ZSProxy.h"

@interface ZSProxy() <NSCopying>
@property (strong, readwrite, nonatomic) id target;
@end

@implementation ZSProxy

#pragma mark -
#pragma mark Class Methods

+ (id)proxyWithTarget:(id)target {
  return [[self alloc]initWithTarget: target];
}

#pragma mark -
#pragma mark Initialization & Deallocation

- (id)initWithTarget:(id)target
{
  if (self) {
    _target = target;
  }
  return self;
}

#pragma mark -
#pragma mark Forwarding

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
  return [self.target methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
  [invocation invokeWithTarget:self.target];
}

#pragma mark -
#pragma mark Target Mimicking

- (Class)class {
  return [self.target class];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@ proxy for target:\n%@", self, self.target];
}

- (BOOL)isProxy {
  return YES;
}

- (BOOL)isKindOfClass:(Class)class {
  return [self.target isKindOfClass:class] || [super isKindOfClass: class];
}

- (BOOL)isMemberOfClass:(Class)class {
  return [self.target isMemberOfClass:class] || [super isMemberOfClass: class];
}

- (BOOL)conformsToProtocol:(Protocol *)protocol {
  return [self.target conformsToProtocol:protocol] || [super conformsToProtocol:protocol];
}

- (BOOL)respondsToSelector:(SEL)selector {
  return [self.target respondsToSelector:selector] || [super respondsToSelector:selector];
}

#pragma mark -
#pragma mark Comparison

- (NSUInteger)hash {
  return [self.target hash];
}

- (BOOL)isEqual:(id)object {
  if ([object isMemberOfClass:[ZSProxy class]]) {
    object = [object target];
  }
  return [self.target isEqual:object];
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(nullable NSZone *)zone {
  return [[[self class] alloc] initWithTarget:[self.target copy]];
}

@end
