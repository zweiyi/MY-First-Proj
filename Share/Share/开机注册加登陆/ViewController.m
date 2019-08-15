//
//  ViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self performSelector:@selector(changView) withObject:self afterDelay:3];
    
    UIImage *startImage = [UIImage imageNamed:@"开机界面.jpg"];
    UIImageView *startImageView = [[UIImageView alloc] init];
    startImageView.image = startImage;
    startImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self.view addSubview:startImageView];
    
}

-(void)changView {
    UIWindow *window = self.view.window;
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    
    window.rootViewController = firstViewController;
}
@end
