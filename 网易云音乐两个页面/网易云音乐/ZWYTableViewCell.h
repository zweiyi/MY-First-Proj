//
//  ZWYTableViewCell.h
//  网易云音乐
//
//  Created by 鳞潜羽翔 on 2019/7/25.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWYTableViewCell : UITableViewCell
@property(nonatomic, strong) UILabel *detileLable1;
@property(nonatomic, strong) UILabel *detileLable2;
@property(nonatomic, strong) UILabel *nameLable;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) NSMutableArray *arrarImageView;
@property(nonatomic, strong) NSMutableArray *arrarLabel;

@end

NS_ASSUME_NONNULL_END
