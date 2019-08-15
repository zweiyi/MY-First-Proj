//
//  DetailTableViewCell.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *lefttypeLabel;
@property (nonatomic, strong) UILabel *leftmessLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UILabel *rightmessLabel;

@end

NS_ASSUME_NONNULL_END
