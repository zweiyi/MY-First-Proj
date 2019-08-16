//
//  WeatherView.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface WeatherView : UIView <UITableViewDelegate, UITableViewDataSource, NSURLSessionDataDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSString *cityName;
@property (nonatomic, copy) NSMutableDictionary *weatherMessageDictionary;
@property (nonatomic, copy) NSMutableDictionary *weathDictionary;
@property (nonatomic, copy) NSMutableArray *messageArray;
@property (nonatomic, copy) NSMutableArray *weekArray;
@property (nonatomic, copy) NSMutableArray *hourlyArray;
@property (nonatomic, assign) NSString *nowflString;
@property (nonatomic, strong) NSString *nowtemp;
-(void) getcityName:(NSString *)cityName;
@end

NS_ASSUME_NONNULL_END
