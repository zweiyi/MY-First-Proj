//
//  CorrectingViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface CorrectingViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic ,strong) NSMutableArray <Student *> *studentArray;
//@property Student *addStudent;
@property (nonatomic ,strong) UITextField *nameTextField;
//@property UITextField *classTextField;
//@property UITextField *sexTextField;
//@property UITextField *ageTextField;
@property (nonatomic ,strong) UITextField *scoreTextField;
@property (nonatomic ,strong) NSString *str;
@end

NS_ASSUME_NONNULL_END
