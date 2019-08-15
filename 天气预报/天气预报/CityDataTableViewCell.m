//
//  CityDataTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/14.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "CityDataTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation CityDataTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.cityNameLabel = [[UILabel alloc] init];
    _cityNameLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_cityNameLabel];
    
    self.dateLabel = [[UILabel alloc] init];
    _dateLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_dateLabel];
    
    self.temLabel = [[UILabel alloc] init];
    _temLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_temLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _cityNameLabel.frame = CGRectMake(10, 40, W / 2, 40);
    _cityNameLabel.font = [UIFont systemFontOfSize:30];
    
    _dateLabel.frame = CGRectMake(10, 5, W / 2, 30);
    _dateLabel.font = [UIFont systemFontOfSize:20];
    
    _temLabel.frame = CGRectMake(W - 120, 10, 120, 60);
    _temLabel.font = [UIFont systemFontOfSize:50];
}

@end
