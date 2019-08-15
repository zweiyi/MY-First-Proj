//
//  TimeView.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimeView : UIView
@property (nonatomic, strong) UIImageView *yunimageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
-(void)getImage : (UIImage *) yunImage andTimeLabelText: (NSString *)timeString andTemperatureLabelText :(NSString *) temperaString;
@end

NS_ASSUME_NONNULL_END
