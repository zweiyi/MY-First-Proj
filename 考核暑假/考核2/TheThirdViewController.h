//
//  TheThirdViewController.h
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheThirdViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property UITableView *tableView;
@property NSArray *dataArray;
@end

NS_ASSUME_NONNULL_END
