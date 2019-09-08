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
@property (nonatomic, strong) NSMutableArray<MyView *> *array;
-(void) getViewPhotoImageViewName:(NSArray *) photoName andName:(NSArray *)Name;
@end

NS_ASSUME_NONNULL_END
