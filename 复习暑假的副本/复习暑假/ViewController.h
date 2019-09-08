//
//  ViewController.h
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/4.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate, AccountPassDelegate>
@property (nonatomic, strong) UITextField *userNametextField;
@property (nonatomic, strong) UITextField *passWordTextField;
@property (nonatomic, strong) NSMutableArray *accountArray;
@property (nonatomic, strong) NSMutableArray *passWordArray;


@end

