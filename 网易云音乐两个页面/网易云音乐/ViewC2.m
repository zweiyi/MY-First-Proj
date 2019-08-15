//
//  ViewC2.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewC2.h"

@interface ViewC2 ()

@end

@implementation ViewC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"视频.png"];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"视频" image:nil tag:101];
    tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed:@"播放红.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
