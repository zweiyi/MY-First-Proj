//
//  ZWYTableViewCell3.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWYTableViewCell3 : UITableViewCell <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
