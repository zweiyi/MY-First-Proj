//
//  SecondTableViewCell.m
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.touImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_touImageView];
    
    self.leftImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_leftImageView];
    
    self.rightImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_rightImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.noteLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_noteLabel];
    
    self.addLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_addLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _touImageView.frame = CGRectMake(10, 10, 50, 60);
    _nameLabel.frame = CGRectMake(70, 10, 100, 20);
    _noteLabel.frame = CGRectMake(70, 30, 300, 20);
    
    _leftImageView.frame = CGRectMake(70, 60, 90, 100);
    _rightImageView.frame = CGRectMake(180, 60, 90, 100);
    _addLabel.frame = CGRectMake(70, 170, 180, 20);
    _addLabel.font = [UIFont systemFontOfSize:12];
    _addLabel.textColor = [UIColor blueColor];
    _timeLabel.frame = CGRectMake(70, 190, 60, 20);
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textColor = [UIColor grayColor];
}


@end
