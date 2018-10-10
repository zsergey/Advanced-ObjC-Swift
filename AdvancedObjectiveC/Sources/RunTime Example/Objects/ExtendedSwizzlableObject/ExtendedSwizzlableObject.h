//
//  ExtendedSwizzlableObject.h
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/10/2018.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "SwizzlableObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExtendedSwizzlableObject : SwizzlableObject

@property (nonatomic, copy, nonnull) NSString* intro;

+ (NSArray <Class> *)allClasses;

- (void)say:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
