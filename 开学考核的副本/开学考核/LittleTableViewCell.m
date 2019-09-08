//
//  LittleTableViewCell.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "LittleTableViewCell.h"

@implementation LittleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _messageLabel = [[UILabel alloc] init];
    [self addSubview:_messageLabel];
    
    _photoimageView = [[UIImageView alloc] init];
    [self addSubview:_photoimageView];
    
    _leftLabel = [[UILabel alloc] init];
    [self addSubview:_leftLabel];
    
    _likeLabel = [[UILabel alloc] init];
    [self addSubview:_likeLabel];
    
    _littleImageView = [[UIImageView alloc] init];
    [self addSubview:_littleImageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _messageLabel.frame = CGRectMake(5, 5, 400, 60);
//    _messageLabel.font = [UIFont systemFontOfSize:12];
    _messageLabel.numberOfLines = 0;
    
    _photoimageView.frame = CGRectMake(5, 65, 400, 150);
    _littleImageView.frame = CGRectMake(5, 220, 30, 30);
    _leftLabel.frame = CGRectMake(35, 220, 80, 30);
    _littleImageView.image = [UIImage imageNamed:@"dian.png"];
    _leftLabel.text = @"猫眼资讯";
    _likeLabel.frame = CGRectMake(314, 220, 100, 30);
    _likeLabel.text = @"6赞  4评";
    
}
@end
