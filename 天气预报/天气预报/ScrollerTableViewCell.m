//
//  ScrollerTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ScrollerTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation ScrollerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.scrollerView = [[UIScrollView alloc] init];
    [self.contentView addSubview:_scrollerView];
    
    self.scrollerView.contentSize = CGSizeMake(100 * 24, 160);
    self.scrollerView.pagingEnabled = NO;
    self.scrollerView.scrollEnabled = YES;
    self.scrollerView.showsVerticalScrollIndicator = NO;
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    
    self.timeViewArray = [NSMutableArray array];
    
    for (int i = 0; i < 24; i++) {
        TimeView *timeView = [[TimeView alloc] initWithFrame:CGRectMake(100 * i, 0, 100, 160)];
        timeView.backgroundColor = [UIColor clearColor];
        [_timeViewArray addObject:timeView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollerView.frame = CGRectMake(0, 0, W, 160);
}

- (void)creatScrollerView:(NSMutableArray *)imageNameArray andTimeArray:(NSMutableArray *)timeArray andTemArray:(NSMutableArray *)temArray {
    for (int i = 0; i < 24; i ++) {
        [_timeViewArray[i]  getImage:[UIImage imageNamed:imageNameArray[i]] andTimeLabelText:timeArray[i] andTemperatureLabelText:temArray[i]];
        [self.scrollerView addSubview:_timeViewArray[i]];
    }
}

@end
