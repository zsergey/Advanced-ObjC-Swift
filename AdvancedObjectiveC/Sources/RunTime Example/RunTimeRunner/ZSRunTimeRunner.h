//
//  ZSRunTimeRunner.h
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSRunTimeRunner : NSObject

- (void)swizzleObject;
- (void)changeIsa;

@end

NS_ASSUME_NONNULL_END
