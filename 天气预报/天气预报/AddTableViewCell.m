//
//  AddTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/13.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "AddTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation AddTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.temLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_temLabel];
    
    self.addButton = [[UIButton alloc] init];
    [_addButton setImage:[UIImage imageNamed:@"增加.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:_addButton];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _temLabel.frame = CGRectMake(10, 5, (W - 10) / 2 , 30);
    _temLabel.text = @"°C/°F";
    _temLabel.font = [UIFont systemFontOfSize:30];
    _temLabel.textColor = [UIColor whiteColor];
    
    _addButton.frame = CGRectMake(W - 50, 10, 30, 30);
    _addButton.backgroundColor = [UIColor clearColor];
}

@end
