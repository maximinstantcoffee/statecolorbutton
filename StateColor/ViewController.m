//
//  ViewController.m
//  StateColor
//
//  Created by w-makishima on 2020/06/04.
//  Copyright © 2020 StateColor. All rights reserved.
//

#import "ViewController.h"
#import "StateColorButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    StateColorButton *button = [[StateColorButton alloc] initWithFrame:CGRectMake(50, 100, 200, 36)];
    [button setTitle:@"button" forState:UIControlStateNormal];

    // 状態に応じて色変更
    [button setBackgroundColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button setBackgroundColor:[UIColor blackColor] forState:UIControlStateDisabled];

    [self.view addSubview:button];
}


@end
