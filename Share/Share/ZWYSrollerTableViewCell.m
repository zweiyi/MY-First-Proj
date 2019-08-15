//
//  ZWYSrollerTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYSrollerTableViewCell.h"

@implementation ZWYSrollerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.contentView addSubview:_scrollView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 4, 200);
}

@end
