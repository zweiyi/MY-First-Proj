//
//  BasicMessTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "BasicMessTableViewCell.h"

@implementation BasicMessTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.noteLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_noteLabel];
    
    return self;
}

- (void)layoutSubviews {
     [super layoutSubviews];
    _nameLabel.frame = CGRectMake(20, 20, 40, 20);
    _noteLabel.frame = CGRectMake(90, 20, 280, 20);
}

@end
