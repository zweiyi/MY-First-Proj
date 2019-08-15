//
//  BasicSexTableViewCell.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "BasicSexTableViewCell.h"

@implementation BasicSexTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.manLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_manLabel];
    
    self.womanLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_womanLabel];
    
    self.manButton = [[UIButton alloc] init];
    [self.contentView addSubview:_manButton];
    
    self.womanButton = [[UIButton alloc] init];
    [self.contentView addSubview:_womanButton];
    
    return self;
}

- (void)layoutSubviews {
     [super layoutSubviews];
    _nameLabel.frame = CGRectMake(20, 20, 40, 20);
    _manButton.frame = CGRectMake(90, 20, 20, 20);
    _manLabel.frame = CGRectMake(110, 20, 20, 20);
    _womanButton.frame = CGRectMake(170, 20, 20, 20);
    _womanLabel.frame = CGRectMake(190, 20, 20, 20);
    _nameLabel.text = @"性别";
    _manLabel.text = @"男";
    _womanLabel.text = @"女";
    [_manButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
    [_womanButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
    [_manButton addTarget:self action:@selector(pressSexMan) forControlEvents:UIControlEventTouchUpInside];
    [_womanButton addTarget:self action:@selector(pressSexWoman) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressSexMan {
    [_manButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
    [_womanButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
}
-(void)pressSexWoman{
    [_manButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
    [_womanButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
}
@end
