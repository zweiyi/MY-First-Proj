//
//  AllMessageViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllMessageViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,strong) NSMutableArray <Student *>*studentAllArray;
@property (nonatomic ,strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
