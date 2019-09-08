//
//  RegisterViewController.h
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RegisterDelegate <NSObject>

-(void) passuserName: (NSString *)userName andPassword: (NSString *) password;

@end

@interface RegisterViewController : UIViewController
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, weak) id <RegisterDelegate> registerDelegate;
@end

NS_ASSUME_NONNULL_END
