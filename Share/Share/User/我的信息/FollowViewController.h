//
//  FollowViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property UITableView *tableView;
@property NSArray *dataArray;
@property UIImage *followImage;
@property UIImage *followedImage;

@end

NS_ASSUME_NONNULL_END
