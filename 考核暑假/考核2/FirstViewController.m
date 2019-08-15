//
//  FirstViewController.m
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FirstViewController.h"
#import "TheThirdViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightBarButtomItem = [[UIBarButtonItem alloc] init];
    [rightBarButtomItem setTarget:self];
    rightBarButtomItem.title = @"PUSH";
    [rightBarButtomItem setAction:@selector(nextThird)];
    self.navigationItem.rightBarButtonItem = rightBarButtomItem;
}

-(void)nextThird {
    TheThirdViewController *theThirdViewController = [[TheThirdViewController alloc] init];
    [self.navigationController pushViewController:theThirdViewController animated:NO];
    UIBarButtonItem *backBarbuttonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backBarbuttonItem;
    backBarbuttonItem.title = @"";
}



@end
