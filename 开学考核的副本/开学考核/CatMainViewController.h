//
//  CatMainViewController.h
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatMainViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *firstScrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *data1Array;
@property (nonatomic, copy) NSArray *data2Array;

@end

NS_ASSUME_NONNULL_END
