//
//  main.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 9/30/18.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ZSRunLoopFactory.h"

int main(int argc, char * argv[]) {
  @autoreleasepool {
    ZSRunLoopFactory* factory = [ZSRunLoopFactory new];
    [factory makeTimerInMain];
    [factory makeTimerInBackground];
    
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
