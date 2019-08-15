//
//  FindViewController.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface FindViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic ,strong) UITextField *classTextField;
@property (nonatomic ,strong) UITextField *nameTextField;
@property (nonatomic ,strong) NSMutableArray *studentArray;
@property (nonatomic ,strong) NSMutableArray *studentFindArray;
@property (nonatomic ) int num;
@end

NS_ASSUME_NONNULL_END
