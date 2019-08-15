//
//  RegisterViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/29.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnTextBlock)(NSString * _Nullable showStr);  //重新定义了一个名字

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
@property UITextField *emailTextField;
@property UITextField *userTextField;
@property UITextField *passTextField;
@property NSString *str;
@property NSString *passStr;
@property ReturnTextBlock returnTextBlock;  //定义的一个属性
-(void)returnText:(ReturnTextBlock)block;
@end

NS_ASSUME_NONNULL_END
