//
//  ViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountMessage.h"

@interface ViewController : UIViewController<UITextFieldDelegate, AccountDelegate>
@property (nonatomic ,strong) UITextField *userNameTextField;
@property (nonatomic ,strong) UITextField *passTextField;
@property (nonatomic ,strong) NSMutableArray *accountArray;


@end

