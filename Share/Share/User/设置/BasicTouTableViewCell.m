//
//  BasicTouTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "BasicTouTableViewCell.h"

@implementation BasicTouTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.touImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_touImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _touImageView.frame = CGRectMake(90, 10, 60, 60);
    _touImageView.image = [UIImage imageNamed:@"sixin_img1.png"];
    _nameLabel.frame = CGRectMake(20, 30, 40, 20);
    _nameLabel.text = @"头像";
}

@end
