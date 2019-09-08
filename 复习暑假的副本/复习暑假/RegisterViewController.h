//
//  RegisterViewController.h
//  复习暑假
//
//  Created by 鳞潜羽翔 on 2019/9/4.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@protocol AccountPassDelegate <NSObject>

-(void) passAccount:(NSString *) userName withPassWorld:(NSString *) passWorld;

@end

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *userNametextField;
@property (nonatomic, strong) UITextField *passWorldTextField;
@property (nonatomic, weak) id <AccountPassDelegate> accountDelegate;
@end

NS_ASSUME_NONNULL_END
