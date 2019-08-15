//
//  UserTableViewCell.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *workLabel;
@property (nonatomic,strong) UILabel *noteLabel;
@property (nonatomic,strong) UIButton *likeButton;
@property (nonatomic,strong) UILabel *likeLabel;
@property (nonatomic,strong) UIImageView *eyeImageView;
@property (nonatomic,strong) UILabel *eyeLabel;
@property (nonatomic,strong) UIImageView *shareImageView;
@property (nonatomic,strong) UILabel *shareLabel;

@end

NS_ASSUME_NONNULL_END
