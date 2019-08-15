//
//  HomeViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property UITableView *tableView;
@property NSInteger *numInteger;
@property NSArray *dataNameArry;
@property NSArray *dataNoteArry;
@property NSArray *dataAuthorArry;
@property NSArray *imageArry;
@property float num;
@end

NS_ASSUME_NONNULL_END
