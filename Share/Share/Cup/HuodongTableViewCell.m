//
//  HuodongTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "HuodongTableViewCell.h"

@implementation HuodongTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.photoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_photoImageView];
    
    return self;
}

- (void)layoutSubviews {
    
    _photoImageView.frame = CGRectMake(10, 10, 384, 180);
    
}

@end
