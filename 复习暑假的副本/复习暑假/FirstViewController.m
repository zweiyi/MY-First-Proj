//
//  FirstViewController.m
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FirstViewController.h"
#import "MmoentsViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStyleDone target:self action:@selector(pressPush)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    rightButtonItem.tintColor = [UIColor blackColor];
    
   
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) pressPush {
    MmoentsViewController *momentsViewController = [[MmoentsViewController alloc] init];
    momentsViewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:momentsViewController animated:NO];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleDone target:self action:nil];
    backButtonItem.tintColor = [UIColor blackColor];
    self.navigationItem.backBarButtonItem = backButtonItem;
}
@end
