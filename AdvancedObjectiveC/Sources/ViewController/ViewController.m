//
//  ViewController.m
//  AdvancedObjectiveC
//
//  Created by Sergey Zapuhlyak on 9/30/18.
//  Copyright © 2018 Sergey Zapuhlyak. All rights reserved.
//

#import "ViewController.h"
#import "ZSBlockRunner.h"

@interface ViewController ()
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic, copy) BOOL (^globalCompletion)(NSUInteger index);
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  ZSBlockRunner *runner = [ZSBlockRunner new];
  [runner sayHello];
  [runner checkBlockTypes];
}

@end
