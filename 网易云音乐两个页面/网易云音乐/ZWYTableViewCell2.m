//
//  ZWYTableViewCell2.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYTableViewCell2.h"

@implementation ZWYTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageV];
    
//    self.btn = [[UIButton alloc] init];
//    [self.contentView addSubview:_btn];
    
    self.touImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_touImageView];
    
    self.degreeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_degreeLabel];
    
    self.iv = [[UIView alloc] init];
    [self.contentView addSubview:_iv];
    
    self.arrayIV = [[NSMutableArray alloc] init];
    self.arrayL = [[NSMutableArray alloc] init];
    self.arraylabel = [[NSMutableArray alloc] init];
    self.arraySwitch = [[NSMutableArray alloc] init];
    
    self.editView = [[UIImageView alloc] init];
    [self.contentView addSubview:_editView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(80, 10, 180, 30);
    
    _imageV.frame = CGRectMake(10, 10, 30, 30);
    
    _touImageView.frame = CGRectMake(10, 20, 60, 60);
    
    _degreeLabel.frame = CGRectMake(80, 50, 80, 20);
   
    _iv.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80);
    
//    _btn.frame = CGRectMake(340, 10, 50, 50);
    
    _editView.frame = CGRectMake(355, 35, 20, 20);

   
}
@end
