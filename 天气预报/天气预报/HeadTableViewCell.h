//
//  HeadTableViewCell.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *weatherLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *todayLabel;
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *maxtemlabel;
@property (nonatomic, strong) UILabel *mintemLabel;

@end

NS_ASSUME_NONNULL_END
