//
//  ManageCityViewController.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/13.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCityViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CityNameDelegate <NSObject>

-(void) passCityTag:(NSInteger ) tag;

@end

@interface ManageCityViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, CityDelegate>
@property (nonatomic, strong) NSMutableArray *cityNameArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id <CityNameDelegate> cityNameDelegate;
@property (nonatomic, copy) NSMutableArray *cityDataArray;
@property (nonatomic, copy) NSMutableDictionary *cityDataDictionary;
@end

NS_ASSUME_NONNULL_END
