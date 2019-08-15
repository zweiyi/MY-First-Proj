//
//  UserTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.headImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headImageView];
    
    self.workLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_workLabel];
    
    self.noteLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_noteLabel];
    
    self.likeLabel = [[UILabel alloc] init];
    self.likeLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:_likeLabel];
    
    
    self.likeButton = [[UIButton alloc] init];
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
    
    _nameLabel.frame = CGRectMake(130, 10, 200, 30);
    _workLabel.frame =CGRectMake(130, 40, 140, 20);
    _noteLabel.frame = CGRectMake(130, 70, 300, 30);
    
    _headImageView.frame = CGRectMake(30, 20, 80, 80);
    //_headImageView.image = [UIImage imageNamed:@"sixin_img1.png"]
    
    _likeButton.frame = CGRectMake(190, 100, 20, 15);
    
    _likeLabel.frame = CGRectMake(213, 100, 30, 20);
    
    _eyeImageView.frame = CGRectMake(250, 100, 20, 15);
    
    
    _eyeLabel.frame = CGRectMake(273, 100, 30, 20);
    
    
    _shareImageView.frame = CGRectMake(130, 100, 20, 15);
    CGRectMake(340, 120, 20, 15);
    
    _shareLabel.frame = CGRectMake(156, 100, 30, 20);
    
    
    _likeLabel.font = [UIFont systemFontOfSize:12];
    _eyeLabel.font = [UIFont systemFontOfSize:12];
    _shareLabel.font = [UIFont systemFontOfSize:12];
    
    _eyeLabel.text = @"26";
    _shareLabel.text = @"20";
    _likeLabel.text = @"102";
    
    [_likeButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_likeButton addTarget:self action:@selector(presslike) forControlEvents:UIControlEventTouchUpInside];
    _likeButton.selected = YES;
    _eyeImageView.image = [UIImage imageNamed:@"button_guanzhu.png"];
    _shareImageView.image = [UIImage imageNamed:@"img1.png"];
}

-(void)presslike {
    if (_likeButton.selected == YES) {
        _likeButton.selected = NO;
        _likeLabel.text = @"103";
    } else {
        _likeLabel.text = @"102";
        _likeButton.selected = YES;
    }
    
}

@end
