//
//  FirstViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController <UITextFieldDelegate>
@property UITextField *passTextField;
@property UITextField *userTextField;
@property UIButton *loadButton;
@property UIButton *registerButton;
@property NSMutableArray *userArray;
@property NSMutableArray *passArray;
@property NSString *userStr;
@property NSString *passStr;

@end

NS_ASSUME_NONNULL_END
