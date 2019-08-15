//
//  TalkViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TalkViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property UITableView *tableView;
@property NSMutableArray *dataArray;
@property UITextField *messgeTextField;
@property NSArray *imageArray;
@property NSMutableArray *messageArray;
@end

NS_ASSUME_NONNULL_END
