//
//  UserTableViewCell2.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "UserTableViewCell2.h"

@implementation UserTableViewCell2

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
    
    _nameLable.frame = CGRectMake(40, 20, 180, 20);
    _littleimageView.frame = CGRectMake(10, 20, 20, 20);
    _littlebutton.frame = CGRectMake(370, 17, 20, 20);
    
}

@end
