//
//  SxinTableViewCell.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SxinTableViewCell : UITableViewCell
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UIImageView *littleimageView;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *noteLabel;

@end

NS_ASSUME_NONNULL_END
