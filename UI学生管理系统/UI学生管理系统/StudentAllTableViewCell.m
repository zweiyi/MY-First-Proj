//
//  StudentAllTableViewCell.m
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "StudentAllTableViewCell.h"
#import "Student.h"

@implementation StudentAllTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    self.classLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_classLabel];
    
    self.sexLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_sexLabel];
    
    self.ageLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_ageLabel];
    
    self.scoreLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_scoreLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _nameLabel.frame = CGRectMake(10, 10, 60, 30);
    _classLabel.frame = CGRectMake(100, 10, 80, 30);
    _sexLabel.frame = CGRectMake(200, 10, 40, 30);
    _ageLabel.frame = CGRectMake(260, 10, 40, 30);
    _scoreLabel.frame = CGRectMake(320, 10, 50, 30);
    _nameLabel.textColor = [UIColor whiteColor];
    _classLabel.textColor = [UIColor whiteColor];
    _sexLabel.textColor = [UIColor whiteColor];
    _ageLabel.textColor = [UIColor whiteColor];
    _scoreLabel.textColor = [UIColor whiteColor];
}

-(void)getMessage:(NSArray <Student *> *)studentArray andIndexPath:(NSIndexPath *)indexPath {
    self.backgroundColor = [UIColor clearColor];
    self.nameLabel.text = studentArray[indexPath.row].NameString;
    self.sexLabel.text = studentArray[indexPath.row].sex;
    self.classLabel.text = studentArray[indexPath.row].classNameString;
    self.ageLabel.text = studentArray[indexPath.row].age;
    self.scoreLabel.text = studentArray[indexPath.row].score;
}

@end
