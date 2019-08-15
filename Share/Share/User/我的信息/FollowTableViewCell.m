//
//  FollowTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FollowTableViewCell.h"

@implementation FollowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLable = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLable];
    
    self.littleimageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_littleimageView];
    
    self.littlebutton = [[UIButton alloc] init];
    [self.contentView addSubview:_littlebutton];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLable.frame = CGRectMake(80, 30, 180, 20);
    _nameLable.font = [UIFont systemFontOfSize:18];
    _littleimageView.frame = CGRectMake(20, 20, 50, 50);
    _littlebutton.frame = CGRectMake(330, 17, 50, 30);
    _littlebutton.selected = YES;
    
}

@end
