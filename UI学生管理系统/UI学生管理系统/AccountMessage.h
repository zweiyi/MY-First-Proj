//
//  AccountMessage.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AccountMessage;

NS_ASSUME_NONNULL_BEGIN
@protocol AccountDelegate <NSObject>

-(void) passAccountMessage :(AccountMessage *)account;

@end
@interface AccountMessage : NSObject
@property (nonatomic ,strong) NSString *accountString;
@property (nonatomic ,strong) NSString *passWordString;


@end

NS_ASSUME_NONNULL_END
