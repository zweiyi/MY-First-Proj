//
//  PhotoCollectionViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.photoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_photoImageView];
    self.photoButton = [[UIButton alloc] init];
    [self.contentView addSubview:_photoButton];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _photoButton.frame = CGRectMake(0, 0, 130, 150);
    _photoImageView.frame = CGRectMake(0, 0, 130, 150);
    _photoButton.backgroundColor = [UIColor colorWithWhite:0.01 alpha:0.01];
    _photoButton.selected = YES;
    _isSelect = YES;
    
}

//- (void)setSelected:(BOOL)selected {
//    [super setSelected:selected];
//    if (selected == YES) {
//        NSLog(@"yes");
//        UIImageView *imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"my_button_pressed.png"]];
//        imageView.frame = CGRectMake(110, 0, 20, 20);
//        [_photoImageView addSubview:imageView];
//        selected = NO;
//    } else {
//        NSLog(@"no");
//        [_photoImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        selected = YES;
//    }
//}

@end
