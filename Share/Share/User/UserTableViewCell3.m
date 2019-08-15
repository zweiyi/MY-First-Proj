//
//  UserTableViewCell3.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "UserTableViewCell3.h"

@implementation UserTableViewCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLable = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLable];
    
    
    self.littlebutton = [[UIButton alloc] init];
    [self.contentView addSubview:_littlebutton];
    
    self.rightLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_rightLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLable.frame = CGRectMake(40, 20, 180, 20);
    _littlebutton.frame = CGRectMake(350, 17, 20, 20);
    _rightLabel.frame = CGRectMake(380, 17, 20, 20);
    
}

@end
