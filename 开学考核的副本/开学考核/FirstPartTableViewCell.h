//
//  FirstPartTableViewCell.h
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstPartTableViewCell : UITableViewCell
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *scrollView1;
@property (nonatomic, strong) UIScrollView *scrollView2;
@property (nonatomic, strong) NSMutableArray<MyView *> *array;
@property (nonatomic, strong) NSMutableArray<MyView *> *array1;
@property (nonatomic, strong) UIButton *nowButton1;
@property (nonatomic, strong) UIButton *nowButton2;
@property (nonatomic, strong) UIButton *mashangButton1;
@property (nonatomic, strong) UIButton *mashangButton2;
-(void) getViewPhotoImageViewName:(NSArray *) photoName andName:(NSArray *)Name;
@end

NS_ASSUME_NONNULL_END
