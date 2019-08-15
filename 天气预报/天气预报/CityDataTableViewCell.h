//
//  CityDataTableViewCell.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/14.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityDataTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *cityNameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *temLabel;
@end

NS_ASSUME_NONNULL_END
