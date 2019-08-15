//
//  ZWYTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/9.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYTableViewCell.h"

@implementation ZWYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.messageLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_messageLabel];
    
    self.touimageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_touimageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _messageLabel.frame = CGRectMake(_labelleft, 10, ([UIScreen mainScreen].bounds.size.width - 150 )/ 2, _labelHeight);
    _messageLabel.layer.borderColor = [UIColor blackColor].CGColor;
    _messageLabel.layer.borderWidth = 1;
    _messageLabel.layer.cornerRadius = 10;
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    
    _touimageView.frame = CGRectMake(_imageleft, 10, 50, 50);
}

- (void)getImageName:(NSString *)name getLabelInfo:(NSString *)Info getHeight:(NSString *)labelHeight andIndexpath:(NSIndexPath *)indexPath  {
    
    //设置图像
    self.touimageView.image = [UIImage imageNamed:name];
    self.messageLabel.text = Info;
    self.messageLabel.numberOfLines = 0;
    //得到label的高度
    _labelHeight = [labelHeight floatValue];
    if (indexPath.row % 2 == 0) {
        _labelleft = [UIScreen mainScreen].bounds.size.width / 2;
        _imageleft = [UIScreen mainScreen].bounds.size.width - 50;
        _messageLabel.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    } else {
        _labelleft = 60;
        _imageleft = 0;
        
    }
    
}

@end
