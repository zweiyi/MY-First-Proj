//
//  ZWYTableViewCell.m
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/25.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYTableViewCell.h"

@implementation ZWYTableViewCell {
    UIImageView *_imageView;
}
@synthesize imageView = _imageView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    //
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLable = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLable];
    
    self.detileLable1 = [[UILabel alloc] init];
    [self.contentView addSubview:_detileLable1];

    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    
    self.detileLable2 = [[UILabel alloc] init];
    [self.contentView addSubview:_detileLable2];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.contentView addSubview:_scrollView];
    
    self.arrarImageView = [[NSMutableArray alloc] init];
    
    self.arrarLabel = [[NSMutableArray alloc] init];
    
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    

    _nameLable.frame = CGRectMake(50, 20, 280, 20);
    
    _imageView.frame = CGRectMake(10, 20, 30, 30);
    
    _detileLable1.frame = CGRectMake(360, 17, 40, 20);
    _detileLable1.font = [UIFont systemFontOfSize:12];
    _detileLable1.textColor = [UIColor grayColor];
    
    _detileLable2.frame = CGRectMake(80, 30, 40, 20);
    
    _scrollView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width
                                   , 100);
    
    
}

@end
