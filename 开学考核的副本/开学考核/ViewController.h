//
//  ViewController.h
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@interface ViewController : UIViewController <RegisterDelegate>
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, copy) NSMutableArray *accountArray;
@property (nonatomic, copy) NSMutableArray *passArray;

@end

