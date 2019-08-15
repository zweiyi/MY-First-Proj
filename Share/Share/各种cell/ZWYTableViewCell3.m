//
//  ZWYTableViewCell3.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYTableViewCell3.h"

@implementation ZWYTableViewCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.scrollview = [[UIScrollView alloc] init];
    [self.contentView addSubview:_scrollview];
    
    _pageControl = [[UIPageControl alloc] init];
    [self.contentView addSubview:_pageControl];
    
    _scrollview.delegate = self;
    for (int i = 0; i < 4; i++) {
        NSString *str = [NSString stringWithFormat:@"main_img%d.png",i+1];
        UIImageView *imagView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:str]];
        imagView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width* i, 0, [UIScreen mainScreen].bounds.size.width, 200);
        [_scrollview addSubview:imagView];
    }
    
    [self initTimeFunction];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollview.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    
    _scrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 4, 200);
    _scrollview.pagingEnabled = YES;
    _pageControl.frame = CGRectMake(90, 200, 200, 10);
    _pageControl.numberOfPages = 4;
    _pageControl.pageIndicatorTintColor = [UIColor blueColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPage = 0;
//    [_pageControl addTarget:self action:@selector(autoSelectPage) forControlEvents:UIControlEventValueChanged];
//    [self.timer fire];
    
    
}

-(void)initTimeFunction {
    //创建定时器
//    if (self.timer == nil) {
        NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoSelectPage) userInfo:nil repeats:YES];
        //    NSTimer *timer =
        NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
        //
        [mainLoop addTimer:timer forMode:NSRunLoopCommonModes];
        //
        self.timer = timer;
//    }
    
}

-(void)autoSelectPage {
    CGPoint offset = _scrollview.contentOffset;
    
    NSInteger currentPage = _pageControl.currentPage;
    if (currentPage == 3) {
        currentPage = 0;
        offset = CGPointZero;
        [_scrollview setContentOffset:offset animated:NO];
    } else {
        currentPage++;
        offset.x = self.contentView.bounds.size.width * currentPage;
        [_scrollview setContentOffset:offset animated:YES];
    }
    
    //更新pageControl显示
    _pageControl.currentPage = currentPage;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_timer fire];
    [self initTimeFunction];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (_scrollview.contentOffset.x == 0) {
//        _pageControl.currentPage = 0;
//    }
//    if (_scrollview.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 1) {
//        _pageControl.currentPage = 1;
//    }
//    if (_scrollview.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 2) {
//        _pageControl.currentPage = 2;
//    }
//    if (_scrollview.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 3) {
//        _pageControl.currentPage = 3;
//    }
    NSInteger i = _scrollview.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    
    _pageControl.currentPage = i;
}

@end
