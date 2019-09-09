//
//  Little2TableViewCell.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "Little2TableViewCell.h"

@implementation Little2TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _messageLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_messageLabel];
    
    _photoimageView1 = [[UIImageView alloc] init];
    [self.contentView addSubview:_photoimageView1];
    
    _photoimageView2 = [[UIImageView alloc] init];
    [self.contentView addSubview:_photoimageView2];
    
    _photoimageView3 = [[UIImageView alloc] init];
    [self.contentView addSubview:_photoimageView3];
    
    _littleImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_littleImageView];
    
    _leftLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_leftLabel];
    
    _rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_rightLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _messageLabel.frame = CGRectMake(5, 5, 400, 40);
//    _messageLabel.font = [UIFont systemFontOfSize:10];
    _messageLabel.numberOfLines = 0;
    
    _photoimageView1.frame = CGRectMake(5, 45, 130, 150);
   _photoimageView2.frame = CGRectMake(135, 45, 130, 150);
    _photoimageView3.frame = CGRectMake(265, 45, 130, 150);
    _littleImageView.frame = CGRectMake(5, 200, 30, 30);
    _littleImageView.image = [UIImage imageNamed:@"dian.png"];
    _leftLabel.frame = CGRectMake(35, 200, 120, 30);
    _leftLabel.text = @"预告片速递";
    _rightLabel.frame = CGRectMake(314, 200, 100, 30);
    _rightLabel.text = @"105评";
    
}

@end
