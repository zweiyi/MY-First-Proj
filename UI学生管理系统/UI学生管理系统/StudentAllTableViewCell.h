//
//  StudentAllTableViewCell.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentAllTableViewCell : UITableViewCell
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *classLabel;
@property (nonatomic ,strong) UILabel *sexLabel;
@property (nonatomic ,strong) UILabel *ageLabel;
@property (nonatomic ,strong) UILabel *scoreLabel;

-(void)getMessage:(NSArray <Student *> *)studentArray andIndexPath:(NSIndexPath *)indexPath;

@end
NS_ASSUME_NONNULL_END
