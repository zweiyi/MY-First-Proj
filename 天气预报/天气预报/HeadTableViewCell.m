//
//  HeadTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "HeadTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation HeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.cityLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_cityLabel];
    
    self.weatherLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_weatherLabel];
    
    self.temperatureLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_temperatureLabel];
    
    self.weekLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_weekLabel];
    
    self.todayLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_todayLabel];
    
    self.mintemLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_mintemLabel];
    
    self.maxtemlabel = [[UILabel alloc] init];
    [self.contentView addSubview:_maxtemlabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _cityLabel.frame = CGRectMake(0,  0, W, 40);
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    _cityLabel.font = [UIFont systemFontOfSize:30];
    _cityLabel.textColor = [UIColor whiteColor];
    
    _weatherLabel.frame = CGRectMake(0, 40, W, 20);
    _weatherLabel.font = [UIFont systemFontOfSize:20];
    _weatherLabel.textAlignment = NSTextAlignmentCenter;
    _weatherLabel.textColor = [UIColor whiteColor];
    
    _weekLabel.frame = CGRectMake(10, 180, 70, 30);
    _weekLabel.font = [UIFont systemFontOfSize:20];
    _weekLabel.textColor = [UIColor whiteColor];
    
    _todayLabel.text = @"今天";
    _todayLabel.textColor = [UIColor whiteColor];
    _todayLabel.frame = CGRectMake(80, 180, 60, 30);
    _todayLabel.font = [UIFont systemFontOfSize:20];
    
    _maxtemlabel.frame = CGRectMake(290, 180, 40, 30);
    _maxtemlabel.textColor = [UIColor whiteColor];
    _maxtemlabel.font = [UIFont systemFontOfSize:20];
    
    _mintemLabel.font = [UIFont systemFontOfSize:20];
    _mintemLabel.frame = CGRectMake(340, 180, 40, 30);
    _mintemLabel.textColor = [UIColor whiteColor];

    _temperatureLabel.frame = CGRectMake(0, 60, W, 100);
    _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    _temperatureLabel.font = [UIFont systemFontOfSize:100];
    _temperatureLabel.textColor = [UIColor whiteColor];

}
@end
