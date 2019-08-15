//
//  FirstTableViewCell.m
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.touImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_touImageView];
    
    self.largeImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_largeImageView];
    
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
    
    _largeImageView.frame = CGRectMake(70, 60, 180, 120);
    _addLabel.frame = CGRectMake(70, 190, 180, 20);
    _addLabel.font = [UIFont systemFontOfSize:12];
    _addLabel.textColor = [UIColor blueColor];
    _timeLabel.frame = CGRectMake(70, 220, 60, 20);
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textColor = [UIColor grayColor];
}


@end
