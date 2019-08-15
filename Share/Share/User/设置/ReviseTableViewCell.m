//
//  ReviseTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ReviseTableViewCell.h"

@implementation ReviseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.noteTextField = [[UITextField alloc] init];
    [self.contentView addSubview:_noteTextField];
    
    return self;
}

- (void)layoutSubviews {
     [super layoutSubviews];
    _nameLabel.frame = CGRectMake(20, 20, 80, 20);
    _noteTextField.frame = CGRectMake(120, 20, 280, 20);
    _noteTextField.secureTextEntry = YES;
}


@end
