//
//  ZWYTableViewCell2.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYTableViewCell2.h"

@implementation ZWYTableViewCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.touxiangImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_touxiangImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.authorLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_authorLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    
    self.likeButton = [[LittleButton alloc] init];
    [self.contentView addSubview:_likeButton];
    
//    self.likeLabel = [[UILabel alloc] init];
//    [self.contentView addSubview:_likeLabel];
    
    self.eyeImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_eyeImageView];
    
    self.eyeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_eyeLabel];
    
    self.shareLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_shareLabel];
    
    self.shareImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_shareImageView];
    
    self.noteLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_noteLabel];
    
    self.imageViewArray = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)layoutSubviews {
    _touxiangImageView.frame = CGRectMake(10, 10, 50, 50);
    _nameLabel.frame = CGRectMake(70, 10, 40, 20);
    _authorLabel.frame = CGRectMake(70, 30, 80, 20);
    _timeLabel.frame = CGRectMake(330, 10 , 80, 10);
    _likeButton.frame = CGRectMake(220, 50, 60, 15);
    
//    _likeLabel.frame = CGRectMake(246, 50, 30, 20);
    
    _eyeImageView.frame = CGRectMake(280, 50, 20, 15);
    
    _eyeLabel.frame = CGRectMake(303, 50, 30, 20);
    
    _shareImageView.frame = CGRectMake(340, 50, 20, 15);
    
    _shareLabel.frame = CGRectMake(363, 50, 30, 20);
    
    _noteLabel.frame = CGRectMake(10, 10, 300, 10);
    
//    _likeLabel.text = @"102";
    [_likeButton setTitle:@"102" forState:UIControlStateNormal];
    [_likeButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_likeButton addTarget:self action:@selector(presslike) forControlEvents:UIControlEventTouchUpInside];
    _likeButton.selected = YES;
}

-(void)presslike {
    if (_likeButton.selected == YES) {
        _likeButton.selected = NO;
         [_likeButton setTitle:@"103" forState:UIControlStateNormal];
    } else {
//        _likeLabel.text = @"102";
         [_likeButton setTitle:@"102" forState:UIControlStateNormal];
    }
    
}
@end
