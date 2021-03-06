//
//  WeekTableViewCell.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeekTableViewCell : UITableViewCell
@property (nonatomic, strong) DayView *dayView;
@end

NS_ASSUME_NONNULL_END
