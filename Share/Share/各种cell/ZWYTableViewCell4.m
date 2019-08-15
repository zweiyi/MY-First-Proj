//
//  ZWYTableViewCell4.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ZWYTableViewCell4.h"

@implementation ZWYTableViewCell4

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.leftImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_leftImageView];
    
    self.authorLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_authorLabel];
    
    self.noteLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_noteLabel];
    
//    self.likeLabel = [[UILabel alloc] init];
//    self.likeLabel.textColor = [UIColor blueColor];
//    [self.contentView addSubview:_likeLabel];
    
    
    self.likeButton = [[LittleButton alloc] init];
    [self.contentView addSubview:_likeButton];
    
    self.eyeLabel = [[UILabel alloc] init];
    _eyeLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:_eyeLabel];
    
    self.eyeImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_eyeImageView];
    
    self.shareLabel = [[UILabel alloc] init];
    _shareLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:_shareLabel];
    
    self.shareImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_shareImageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _nameLabel.frame = CGRectMake(210, 10, 200, 30);
    _authorLabel.frame =CGRectMake(210, 40, 80, 20);
    _noteLabel.frame = CGRectMake(210, 60, 130, 60);
    
    _nameLabel.numberOfLines = 0;
    _noteLabel.numberOfLines = 0;
    
    _leftImageView.frame = CGRectMake(0, 0, 200, 150);
    
    _likeButton.frame = CGRectMake(220, 120, 60, 15);
    
//    _likeLabel.frame = CGRectMake(246, 120, 30, 20);
    
    _eyeImageView.frame = CGRectMake(280, 120, 20, 15);
    
    _eyeLabel.frame = CGRectMake(303, 120, 30, 20);
    
    _shareImageView.frame = CGRectMake(340, 120, 20, 15);
    
    _shareLabel.frame = CGRectMake(363, 120, 30, 20);
    
//    _likeLabel.font = [UIFont systemFontOfSize:12];
    _eyeLabel.font = [UIFont systemFontOfSize:12];
    _shareLabel.font = [UIFont systemFontOfSize:12];
    
    _eyeLabel.text = @"26";
    _shareLabel.text = @"20";
//    _likeLabel.text = @"102";
    
    _authorLabel.font = [UIFont systemFontOfSize:14];
    _noteLabel.font = [UIFont systemFontOfSize:14];
    
    [_likeButton setTitle:@"102" forState:UIControlStateNormal];
    [_likeButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_likeButton addTarget:self action:@selector(presslike) forControlEvents:UIControlEventTouchUpInside];
    _likeButton.selected = YES;
    _eyeImageView.image = [UIImage imageNamed:@"button_guanzhu.png"];
    _shareImageView.image = [UIImage imageNamed:@"button_share.png"];
}

-(void)presslike {
    if (_likeButton.selected == YES) {
        _likeButton.selected = NO;
        [_likeButton setTitle:@"103"
                     forState:UIControlStateNormal];
//        _likeLabel.text = @"103";
    } else {
//        _likeLabel.text = @"102";
        [_likeButton setTitle:@"102" forState:UIControlStateNormal];
        _likeButton.selected = YES;
    }
    
}
@end
