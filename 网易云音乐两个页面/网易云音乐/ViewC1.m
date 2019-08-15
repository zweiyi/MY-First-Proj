//
//  ViewC1.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewC1.h"
#import "ViewC6.h"

@interface ViewC1 ()

@end

@implementation ViewC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"发现2.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:nil tag:101];
    tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed:@"发现.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
