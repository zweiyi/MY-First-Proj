//
//  ZWYTableViewCell2.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LittleButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZWYTableViewCell2 : UITableViewCell

@property UIImageView *touxiangImageView;
@property UILabel *nameLabel;
@property UILabel *authorLabel;
@property UILabel *timeLabel;
@property (nonatomic,strong) LittleButton *likeButton;
//@property (nonatomic,strong) UILabel *likeLabel;
@property (nonatomic,strong) UIImageView *eyeImageView;
@property (nonatomic,strong) UILabel *eyeLabel;
@property (nonatomic,strong) UIImageView *shareImageView;
@property (nonatomic,strong) UILabel *shareLabel;
@property NSMutableArray *imageViewArray;
@property UILabel *noteLabel;
@end

NS_ASSUME_NONNULL_END
