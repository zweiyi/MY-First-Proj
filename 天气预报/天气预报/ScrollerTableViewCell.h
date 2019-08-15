//
//  ScrollerTableViewCell.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScrollerTableViewCell : UITableViewCell
@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) NSMutableArray <TimeView *> *timeViewArray;

-(void)creatScrollerView :(NSMutableArray *)imageNameArray andTimeArray:(NSMutableArray *)timeArray andTemArray: (NSMutableArray *)temArray;
@end

NS_ASSUME_NONNULL_END
