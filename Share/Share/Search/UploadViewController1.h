//
//  UploadViewController1.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UploadViewController1 : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
@property UIButton *selectImageButton;
@property UITextField *nameTextField;
@property UITextView *messageTextView;
@property UIButton *sharButton;
@property UITableView *tableview;
@property NSMutableArray *dataArray;
@property BOOL isOpen;
@property UIButton *openButton;
@property NSString *str;
@property UILabel *messPlaceHoderLabel;
@property NSNumber *num;

@end

NS_ASSUME_NONNULL_END
