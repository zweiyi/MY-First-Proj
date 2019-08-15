//
//  AddCityViewController.h
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CityDelegate <NSObject>

-(void)passCityName:(NSString *)cityName;

@end

@interface AddCityViewController : UIViewController
<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITextField *addTextField;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *cityNameArray;
@property (nonatomic, copy) NSMutableArray *seachcityArray;
@property (nonatomic, weak) id<CityDelegate> cityDelegate;

@end

NS_ASSUME_NONNULL_END
