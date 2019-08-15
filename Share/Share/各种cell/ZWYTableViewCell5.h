//
//  ZWYTableViewCell5.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LittleButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZWYTableViewCell5 : UITableViewCell
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *authorLabel;
@property (nonatomic,strong) UILabel *noteLabel;
@property (nonatomic,strong) LittleButton *likeButton;
//@property (nonatomic,strong) UILabel *likeLabel;
@property (nonatomic,strong) UIImageView *eyeImageView;
@property (nonatomic,strong) UILabel *eyeLabel;
@property (nonatomic,strong) UIImageView *shareImageView;
@property (nonatomic,strong) UILabel *shareLabel;
@end

NS_ASSUME_NONNULL_END
