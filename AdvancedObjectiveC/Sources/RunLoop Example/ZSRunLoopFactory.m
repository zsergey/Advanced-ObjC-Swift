//
//  ZSRunLoopFactory.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 10/4/18.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ZSRunLoopFactory.h"

@interface ZSRunLoopFactory()
@property (assign) NSUInteger counter;
@end

static NSString* const ThreadExitKey = @"Exit";

@implementation ZSRunLoopFactory

////////////////////////////////////////////
// RunLoop is infinity loop like this:
//
// while (true) {
//  @autoreleasepool {
//
//  }
// }

- (void)makeTimerInMain {
  
  @autoreleasepool {
    NSThread *currentThread = [NSThread currentThread];
    BOOL moreWorkToDo = YES;
    BOOL isExit = NO;
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [self performSelector:@selector(exitRunLoop) withObject:nil afterDelay:5];
    
    NSLog(@"Start run loop");
    while (moreWorkToDo && !isExit) {
      [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
      isExit = [currentThread.threadDictionary[ThreadExitKey] boolValue];
    }
    NSLog(@"End run loop");
    [timer invalidate];
  }
}

- (void)update {
  NSLog(@"Waiting for exit from infinite loop...");
}

- (void)exitRunLoop {
  NSThread *currentThread = [NSThread currentThread];
  currentThread.threadDictionary[ThreadExitKey] = @YES;
}

- (void)makeTimerInBackground {
  self.counter = 0;
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    @autoreleasepool {
      
      NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.counter++;
        NSLog(@"Timer counter from background thread: %lu", (unsigned long)self.counter);
      }];
      
      // Everything thread has a runloop that sleeps (currentRunLoop)
      // You should wake it up to have working NSTimer.
      NSRunLoop *runLoop = NSRunLoop.currentRunLoop;
      [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
      [runLoop run];
    }
  });
}

@end
