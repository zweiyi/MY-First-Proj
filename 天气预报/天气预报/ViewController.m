//
//  ViewController.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/10.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ViewController.h"
#import "ManageCityViewController.h"
#import "AddCityViewController.h"
#import "DayView.h"
#import "TimeView.h"
#import "WeatherView.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height


@interface ViewController () {
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yun.jpg"]];
    backImageView.frame = CGRectMake(0, 0, W, H);
    [self.view insertSubview:backImageView atIndex:0];
    
    _cityMutableArray = [NSMutableArray array];
    [_cityMutableArray addObject: @"西安"];
    [_cityMutableArray addObject:@"北京"];
    [_cityMutableArray addObject:@"上海"];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, W, H)];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(W * 0.8, H - 50, 40, 40)];
    addButton.backgroundColor = [UIColor clearColor];
    [addButton setImage:[UIImage imageNamed:@"菜单栏.png"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    _pageController = [[UIPageControl alloc] init];
    _pageController.center = CGPointMake(W / 2, H * 0.93);
    _pageController.currentPage = 0;
    _pageController.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageController.pageIndicatorTintColor = [UIColor grayColor];
//    [_pageController addTarget:self action:@selector(pageControlScrollView) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageController];
    
    self.page = _cityMutableArray.count;
    
    _weatherMessageDictionary = [NSMutableDictionary dictionary];
    
    [self loadScrollView];
}

-(void)loadScrollView {
    if (_scrollView.subviews) {
        [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    _scrollView.contentSize = CGSizeMake(W * _cityMutableArray.count, H);
    _pageController.numberOfPages = _cityMutableArray.count;
   
    for (int i = 0; i < _cityMutableArray.count; i++) {
        WeatherView *weatherView = [[WeatherView alloc] initWithFrame:self.view.bounds];
        [weatherView getcityName:_cityMutableArray[i]];
        weatherView.frame = CGRectMake(W * i, 0, W, H * 0.93);
        [_scrollView addSubview:weatherView];
        weatherView.backgroundColor = [UIColor clearColor];
    }
}

-(void)pressAdd {
    ManageCityViewController *manageCityViewController = [[ManageCityViewController alloc] init];
    manageCityViewController.cityNameArray = _cityMutableArray;
    manageCityViewController.cityNameDelegate = self;
    [self presentViewController:manageCityViewController animated:NO completion:nil];
   
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int pageInt;
    pageInt = _scrollView.contentOffset.x / W;
    _pageController.currentPage = pageInt;
}


- (void)passCityTag:(NSInteger)tag {
//    _pageController.numberOfPages = tag + 1;
    [self loadScrollView];
    _pageController.currentPage = tag;
//     NSLog(@"curr====%ld", (long)_pageController.currentPage);
//    NSLog(@"tag=====%ld", (long)tag);
    [self pageControlScrollView];
   
}

-(void)pageControlScrollView {
    NSInteger currentPage = _pageController.currentPage;
    CGPoint offset = _scrollView.contentOffset;
    offset.x = W * currentPage;
    [_scrollView setContentOffset:offset];
//    NSLog(@"_scroller.current%ld", (long)currentPage);
//    NSLog(@"======%lu", (unsigned long)_cityMutableArray.count);
}

@end
