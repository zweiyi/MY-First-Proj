//
//  RegisterViewController.h
//  考核2
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RegisterDelegate <NSObject>

-(void)pass:(NSString *)str1 andPass:(NSString *)str2;

@end

@interface RegisterViewController : UIViewController
@property UITextField *accountTextField;
@property UITextField *passTextField;
@property NSObject<RegisterDelegate> *registerDelegate;
@end

NS_ASSUME_NONNULL_END
