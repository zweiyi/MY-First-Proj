//
//  TimeView.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.yunimageView = [[UIImageView alloc] init];
    _yunimageView.frame = CGRectMake(20, 50, 50, 40);
    _yunimageView.tintColor = [UIColor whiteColor];
    [self addSubview:_yunimageView];
    
    self.timeLabel = [[UILabel alloc] init];
    _timeLabel.frame = CGRectMake(0, 5, 100, 30);
    _timeLabel.textColor = [UIColor whiteColor];
    _timeLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:_timeLabel];
    
    self.temperatureLabel = [[UILabel alloc] init];
    _temperatureLabel.frame = CGRectMake(20, 115, 60, 30);
    _temperatureLabel.font = [UIFont systemFontOfSize:20];
    _temperatureLabel.textColor = [UIColor whiteColor];
    [self addSubview:_temperatureLabel];
    
    return self;
    
}

- (void)getImage:(UIImage *)yunImage andTimeLabelText:(NSString *)timeString andTemperatureLabelText:(NSString *)temperaString {
    self.yunimageView.image = yunImage;
    
    self.timeLabel.text = timeString;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    
    self.temperatureLabel.text = temperaString;
    _temperatureLabel.textAlignment = NSTextAlignmentCenter;
}

@end
