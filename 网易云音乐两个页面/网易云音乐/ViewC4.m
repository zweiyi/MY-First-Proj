//
//  ViewC4.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewC4.h"

@interface ViewC4 ()

@end

@implementation ViewC4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"朋友.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"朋友" image:nil tag:101];
    tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed:@"朋友红.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
