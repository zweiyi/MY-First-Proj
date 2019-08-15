//
//  LittleButton.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/5.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "LittleButton.h"

@implementation LittleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(25, 0, 30, 20);
    self.imageView.frame = CGRectMake(0, 0, 20, 15);
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textColor = [UIColor blueColor];
}

@end
