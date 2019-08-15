//
//  DetailTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "DetailTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.lefttypeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_lefttypeLabel];
    
    self.leftmessLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_leftmessLabel];
    
    self.rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_rightLabel];
    
    self.rightmessLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_rightmessLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _lefttypeLabel.frame = CGRectMake(10, 5, 80, 20);
    _lefttypeLabel.font = [UIFont systemFontOfSize:14];
    _lefttypeLabel.textColor = [UIColor whiteColor];

    
    _leftmessLabel.frame = CGRectMake(10, 30, (W - 20) / 2, 30);
    _leftmessLabel.textColor = [UIColor whiteColor];
    _leftmessLabel.font = [UIFont systemFontOfSize:20];
    
    _rightLabel.frame = CGRectMake((W - 20) / 2, 5, 100, 20);
    _rightLabel.font = [UIFont systemFontOfSize:14];
    _rightLabel.textColor = [UIColor whiteColor];
    
    _rightmessLabel.frame = CGRectMake((W - 20) / 2, 30, (W - 20) / 2, 30);
    _rightmessLabel.textColor = [UIColor whiteColor];
    _rightmessLabel.font = [UIFont systemFontOfSize:20];
}

@end
