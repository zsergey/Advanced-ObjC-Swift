//
//  ZSProxy.h
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 9/30/18.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSProxy : NSProxy

@property (readonly, nonatomic) id target;

+ (id)proxyWithTarget:(id)target;

- (id)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
