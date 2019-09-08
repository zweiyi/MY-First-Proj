//
//  LittleTableViewCell.h
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LittleTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *photoimageView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *likeLabel;
@property (nonatomic, strong) UIImageView *littleImageView;

@end

NS_ASSUME_NONNULL_END
