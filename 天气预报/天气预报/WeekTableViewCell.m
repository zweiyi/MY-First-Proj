//
//  WeekTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "WeekTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation WeekTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.dayView = [[DayView alloc] init];
    [self.contentView addSubview:_dayView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _dayView.frame = CGRectMake(0, 0, W, 50);
}

@end
