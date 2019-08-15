//
//  NoteViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property UIScrollView *scrollView;
@property UITableView *tableView1;
@property UITableView *tableView2;
@property UITableView *tableView3;
@property NSArray *dataArray;
@property NSArray *array;
@property UISegmentedControl *segment;
@end

NS_ASSUME_NONNULL_END
