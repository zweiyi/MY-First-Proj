//
//  RegisterViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic ,strong) UITextField *userNameTextField;
@property (nonatomic ,strong) UITextField *passTextField;
@property (nonatomic ,strong) UITextField *surePassWordTextField;
@property (nonatomic ,strong) NSMutableArray *accountArray;
@property (nonatomic ,strong) NSObject<AccountDelegate> *accountDelegate;
@property (nonatomic ,strong) AccountMessage *accountMess;
@property BOOL registerSucceed;
@end

NS_ASSUME_NONNULL_END
