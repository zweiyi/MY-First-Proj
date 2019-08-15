//
//  SetTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SetTableViewCell.h"

@implementation SetTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLable = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLable];
    
    
    self.littlebutton = [[UIButton alloc] init];
    [self.contentView addSubview:_littlebutton];
    
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLable.frame = CGRectMake(40, 20, 180, 20);
    _littlebutton.frame = CGRectMake(350, 17, 20, 20);
    _littlebutton.selected = YES;
    
}


@end
