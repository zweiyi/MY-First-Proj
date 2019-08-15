//
//  PhotoCollectionViewCell.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/31.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCollectionViewCell : UICollectionViewCell
@property UIImageView *photoImageView;
@property UIButton *photoButton;
@property BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
