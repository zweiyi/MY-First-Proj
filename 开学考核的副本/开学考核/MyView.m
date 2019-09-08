//
//  MyView.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _photoImageView = [[UIImageView alloc] init];
    [self addSubview:_photoImageView];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    
    _sellLabel = [[UILabel alloc] init];
    [self addSubview:_sellLabel];
    
    return self;
}

- (void)layoutSubviews {
    _photoImageView.frame = CGRectMake(0, 0, 120, 120);
    _nameLabel.frame = CGRectMake(0, 125, 120, 20);
    _sellLabel.frame = CGRectMake(0, 145, 120, 20);
}

@end
