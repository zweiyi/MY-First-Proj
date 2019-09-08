//
//  MomentsTableViewCell.m
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "MomentsTableViewCell.h"

@implementation MomentsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _photoImageView = [[UIImageView alloc] init];
    [self addSubview:_photoImageView];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    
    
    
    return  self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _photoImageView.frame = CGRectMake(10, 10, 80, 80);
    _nameLabel.frame = CGRectMake(90, 10, 100, 80);
    _nameLabel.numberOfLines = 0;
}

@end
