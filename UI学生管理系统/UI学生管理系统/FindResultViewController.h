//
//  FindResultViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface FindResultViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,strong) NSMutableArray *studentFindArray;
@property (nonatomic ,strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
