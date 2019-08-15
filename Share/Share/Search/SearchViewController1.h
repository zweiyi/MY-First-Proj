//
//  SearchViewController1.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController1 : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property UITextField *searchedTextField;
@property UITableView *tableView;
@property NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
