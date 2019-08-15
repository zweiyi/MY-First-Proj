//
//  ViewController.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/10.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManageCityViewController.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, CityNameDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageController;
@property (nonatomic, copy) NSMutableArray *cityMutableArray;
@property (nonatomic, copy) NSMutableDictionary *weatherMessageDictionary;
@property (nonatomic, assign) NSInteger page;
@end

