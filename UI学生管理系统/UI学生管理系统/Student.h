//
//  Student.h
//  UI学生管理系统
//
//  Created by 鳞潜羽翔 on 2019/8/6.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;

NS_ASSUME_NONNULL_BEGIN
@protocol StudentDelegate <NSObject>

-(void) passStudent :(Student *) student;

@end

@interface Student : NSObject
@property (nonatomic ,strong) NSString *NameString;
@property (nonatomic ,strong) NSString *classNameString;
@property (nonatomic ,strong) NSString *age;
@property (nonatomic ,strong) NSString *sex;
@property (nonatomic ,strong) NSString *score;
@end

NS_ASSUME_NONNULL_END
