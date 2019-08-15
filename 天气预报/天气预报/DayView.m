//
//  DayView.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "DayView.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height


@implementation DayView

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
    _yunimageView.frame = CGRectMake(170, 5, 50, 50);
//    _yunimageView.tintColor = [UIColor whiteColor];
    [self addSubview:_yunimageView];
    
    self.timeLabel = [[UILabel alloc] init];
    _timeLabel.frame = CGRectMake(10, 5, 100, 30);
    _timeLabel.font = [UIFont systemFontOfSize:20];
    _timeLabel.textColor = [UIColor whiteColor];
    [self addSubview:_timeLabel];
    
    self.maxTmperatureLabel = [[UILabel alloc] init];
    _maxTmperatureLabel.frame = CGRectMake(290, 5, 40, 30);
    _maxTmperatureLabel.textColor = [UIColor whiteColor];
    _maxTmperatureLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:_maxTmperatureLabel];
    
    self.minTemperatureLabel = [[UILabel alloc] init];
    _minTemperatureLabel.frame = CGRectMake(340, 5, 40, 30);
    _minTemperatureLabel.font = [UIFont systemFontOfSize:20];
    _minTemperatureLabel.textColor = [UIColor whiteColor];
    
    [self addSubview:_minTemperatureLabel];
    
    return self;
}

- (void)getImage:(UIImage *)yunImage andTimeLabelText:(NSString *)timeString andMAxTemperatureLabelText:(NSString *)maxtemperaString andMinTemperatureLabelText:(NSString *)mintempareString {
    self.yunimageView.image = yunImage;
    self.maxTmperatureLabel.text = maxtemperaString;
    self.minTemperatureLabel.text = mintempareString;
    self.timeLabel.text = timeString;
    
    
}

@end
