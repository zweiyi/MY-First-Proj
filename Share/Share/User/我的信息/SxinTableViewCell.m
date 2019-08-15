//
//  SxinTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SxinTableViewCell.h"

@implementation SxinTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.littleimageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_littleimageView];
    
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    
    self.noteLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_noteLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(90, 20, 180, 20);
    _littleimageView.frame = CGRectMake(20, 20, 60, 60);
    _noteLabel.frame = CGRectMake(90, 55, 200, 30);
    _noteLabel.textColor = [UIColor blueColor];
    _noteLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.frame = CGRectMake(320, 17, 160, 30);
    
}

@end
