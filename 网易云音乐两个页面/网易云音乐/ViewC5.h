//
//  ViewC5.h
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/26.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewC5 : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray *array1;
@property(nonatomic, copy) NSArray *array2;

@end

NS_ASSUME_NONNULL_END
