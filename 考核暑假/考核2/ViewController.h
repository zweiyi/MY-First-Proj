//
//  ViewController.h
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate, RegisterDelegate>
@property UITextField *accountTextField;
@property UITextField *passTextField;
@property NSString *accountString;
@property NSString *passString;


@end

