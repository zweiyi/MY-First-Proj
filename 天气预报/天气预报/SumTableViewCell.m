//
//  SumTableViewCell.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SumTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation SumTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.sumlabel = [[UILabel alloc] init];
    [self.contentView addSubview:_sumlabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _sumlabel.frame = CGRectMake(10, 0, W, 80);
    _sumlabel.numberOfLines = 0;
    _sumlabel.textColor = [UIColor whiteColor];
    _sumlabel.backgroundColor = [UIColor clearColor];
    _sumlabel.textAlignment = NSTextAlignmentLeft;
    _sumlabel.font = [UIFont systemFontOfSize:20];
}

@end
