//
//  AddViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/7.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic ,strong) NSMutableArray <Student *> *studentArray;
@property (nonatomic ,strong) Student *addStudent;
@property (nonatomic ,strong) UITextField *nameTextField;
@property (nonatomic ,strong) UITextField *classTextField;
@property (nonatomic ,strong) UITextField *sexTextField;
@property (nonatomic ,strong) UITextField *ageTextField;
@property (nonatomic ,strong) UITextField *scoreTextField;

@end

NS_ASSUME_NONNULL_END
