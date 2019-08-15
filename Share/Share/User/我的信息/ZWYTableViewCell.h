//
//  ZWYTableViewCell.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/9.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWYTableViewCell : UITableViewCell
@property CGFloat labelHeight;
@property CGFloat imageleft;
@property CGFloat labelleft;
@property UIImageView *touimageView;
@property UILabel *messageLabel;
-(void)getImageName:(NSString *)name getLabelInfo:(NSString *)Info  getHeight:(NSString *)labelHeight andIndexpath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
