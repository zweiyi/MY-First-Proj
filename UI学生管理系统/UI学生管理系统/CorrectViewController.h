//
//  CorrectViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface CorrectViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic ,strong) NSMutableArray *studentArray;
@property (nonatomic ,strong) Student *CorrectStudent;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UITextField *nameTextField;
@end

NS_ASSUME_NONNULL_END
