//
//  DeleteViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeleteViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property(nonatomic ,strong) NSMutableArray *studentArray;
@property(nonatomic ,strong) Student *deleteStudent;
@property(nonatomic ,strong) UITableView *tableView;
@property(nonatomic ,strong) UITextField *nameTextField;
@end

NS_ASSUME_NONNULL_END
