//
//  WeatherView.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.


#import "WeatherView.h"
#import "HeadTableViewCell.h"
#import "WeekTableViewCell.h"
#import "ScrollerTableViewCell.h"
#import "DetailTableViewCell.h"
#import "SumTableViewCell.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation WeatherView 


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
//    UIImageView *backimageView = [[UIImageView alloc] init];
//    backimageView.image = [UIImage imageNamed:@"yun.jpg"];
//    backimageView.frame = self.bounds;
//    [self insertSubview:backimageView atIndex:0];
    
    _weatherMessageDictionary = [NSMutableDictionary dictionary];
   
    
    _messageArray = [NSMutableArray array];
    _weathDictionary = [NSMutableDictionary dictionary];
    _weekArray = [NSMutableArray array];
    _hourlyArray = [NSMutableArray array];
    
    return self;
}

-(void) creatDataTask {
    NSString *urlString = [NSString stringWithFormat:@"https://free-api.heweather.net/s6/weather?location=%@&key=8a1ea338b1c2465488be872925af3be8", _cityName];
    
//    [@"http://api.k780.com/?app=weather.realtime&weaid=%@&ag=futureDay,,futureHour&appkey=44509&sign=3fc6d1d99c68457934f71a4f0e99b7a2&format=json", _cityName];
    NSString *urlyuString = [NSString stringWithFormat:@"http://api.k780.com/?app=weather.realtime&weaid=%@&ag=futureDay,,futureHour&appkey=44509&sign=3fc6d1d99c68457934f71a4f0e99b7a2&format=json", _cityName];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    urlyuString = [urlyuString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    //创建请求地址
    NSURL *url = [NSURL URLWithString:urlString];
    NSURL *urlyu = [NSURL URLWithString:urlyuString];
    
    //    NSURL *urlnow = [NSURL URLWithString:urlnowString];
    //创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLRequest *yurequest = [NSURLRequest requestWithURL:urlyu];
    
    //创建会话
    
    NSURLSession *sharedsession = [NSURLSession sharedSession];
    NSURLSession *sharedsessionyu = [NSURLSession sharedSession];
    
//    创建任务
    NSURLSessionDataTask *dataTask = [sharedsession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (data) {
            id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                        self->_weatherMessageDictionary = objc[@"HeWeather6"][0][@"daily_forecast"][0];
            self->_messageArray = objc[@"HeWeather6"][0][@"daily_forecast"];
            self->_nowflString = objc[@"HeWeather6"][0][@"now"][@"fl"];
//            回到主线程的方法
//            1.
            [self performSelectorOnMainThread:@selector(datareloadData) withObject:self waitUntilDone:NO];
        }
    }];
    
    NSURLSessionDataTask *dataTaskyu = [sharedsessionyu dataTaskWithRequest:yurequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            self->_weekArray = objc[@"result"][@"futureDay"];
            self->_hourlyArray = objc[@"result"][@"futureHour"];
            [self performSelectorOnMainThread:@selector(datareloadData) withObject:self waitUntilDone:NO];
        }
    }];
    
    [dataTaskyu resume];
    
    [dataTask resume];
}

-(void)creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H * 0.93) style:UITableViewStylePlain];
    
    [self addSubview:_tableView];
   
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];

    [_tableView registerClass:[HeadTableViewCell class] forCellReuseIdentifier:@"headCell"];
    [_tableView registerClass:[WeekTableViewCell class] forCellReuseIdentifier:@"weekCell"];
    [_tableView registerClass:[ScrollerTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
    [_tableView registerClass:[SumTableViewCell class] forCellReuseIdentifier:@"sumCell"];
    [_tableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:@"detailCell"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        HeadTableViewCell *headCell = [_tableView dequeueReusableCellWithIdentifier:@"headCell" forIndexPath:indexPath];
        if (_messageArray.count && _weekArray.count) {
            headCell.backgroundColor = [UIColor clearColor];
            headCell.cityLabel.text = _cityName;
            headCell.temperatureLabel.text = [NSString stringWithFormat:@"%@°", _messageArray[0][@"tmp_min"]];
            headCell.weatherLabel.text =  _weatherMessageDictionary[@"cond_txt_d"];
            headCell.weekLabel.text = _weekArray[0][@"week"];
            headCell.maxtemlabel.text =  [NSString stringWithFormat:@"%@°", _messageArray[0][@"tmp_max"]];
            headCell.mintemLabel.text =  [NSString stringWithFormat:@"%@°", _messageArray[0][@"tmp_min"]];
        }
        return headCell;
    }
    else if (indexPath.section == 1) {
        ScrollerTableViewCell *scrollerCell = [_tableView dequeueReusableCellWithIdentifier:@"scrollCell" forIndexPath:indexPath];
        if (_hourlyArray.count) {
            NSMutableArray *array1 = [NSMutableArray array];
            NSMutableArray *array2 = [NSMutableArray array];
            NSMutableArray *array3 = [NSMutableArray array];
            for (int i = 0; i < _hourlyArray.count; i++) {
                NSMutableString *str = [NSMutableString stringWithFormat:@"%@", _hourlyArray[i][@"dateYmdh"]];
                [str deleteCharactersInRange: NSMakeRange(0, 11)];
                [str deleteCharactersInRange:NSMakeRange(5, 3)];
                [array1 addObject: [NSString stringWithFormat:@"%@.png", _hourlyArray[i][@"wtIcon"]]];
                [array2 addObject:str];
                [array3 addObject:_hourlyArray[i][@"wtTemp"]];
            }
            [scrollerCell creatScrollerView:array1 andTimeArray:array2 andTemArray:array3];
        }
        return scrollerCell;
    } else if (indexPath.section == 2) {
        WeekTableViewCell *weekCell = [_tableView dequeueReusableCellWithIdentifier:@"weekCell" forIndexPath:indexPath];
        if (_weekArray.count) {
            
            [weekCell.dayView getImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", _weekArray[indexPath.row][@"wtIcon1"]]] andTimeLabelText:_weekArray[indexPath.row][@"week"] andMAxTemperatureLabelText:_weekArray[indexPath.row][@"wtTemp1"] andMinTemperatureLabelText:_weekArray[indexPath.row][@"wtTemp2"]];
        }
        return weekCell;
    } else if (indexPath.section == 3) {
        SumTableViewCell *sumCell = [_tableView dequeueReusableCellWithIdentifier:@"sumCell" forIndexPath:indexPath];
        if (_messageArray.count) {
            sumCell.backgroundColor = [UIColor clearColor];
            sumCell.sumlabel.text = [NSString stringWithFormat:@"今天：现在%@。最高气温%@°。今晚：%@,最低气温%@°", _messageArray[0][@"cond_txt_d"],_messageArray[0][@"tmp_max"], _messageArray[0][@"cond_txt_n"], _messageArray[0][@"tmp_min"]];
        }
        
        return sumCell;
    } else {
        DetailTableViewCell *detailCell = [_tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
        if (_messageArray.count) {
            detailCell.backgroundColor = [UIColor clearColor];
            if (indexPath.row == 0) {
                detailCell.lefttypeLabel.text = @"日出";
                detailCell.leftmessLabel.text = [NSString stringWithFormat:@"上午%@", _messageArray[0][@"sr"]];
                detailCell.rightLabel.text = @"日落";
                detailCell.rightmessLabel.text = [NSString stringWithFormat:@"上午%@", _messageArray[0][@"ss"]];
            }
            if (indexPath.row == 1) {
                detailCell.lefttypeLabel.text = @"降雨概率";
                detailCell.leftmessLabel.text = [NSString stringWithFormat:@"%@%%", _messageArray[0][@"pop"]];
                detailCell.rightLabel.text = @"湿度";
                detailCell.rightmessLabel.text = [NSString stringWithFormat:@"%@%%", _messageArray[0][@"hum"]];
            }
            if (indexPath.row == 2) {
                detailCell.lefttypeLabel.text = @"风";
                detailCell.leftmessLabel.text = [NSString stringWithFormat:@"%@%@公里/时", _messageArray[0][@"wind_dir"], _messageArray[0][@"wind_spd"]];
                            detailCell.rightLabel.text = @"体感温度";
                            detailCell.rightmessLabel.text = [NSString stringWithFormat:@"%@°", _nowflString];
            }
            if (indexPath.row == 3) {
                detailCell.lefttypeLabel.text = @"降水量";
                detailCell.leftmessLabel.text = [NSString stringWithFormat:@"%@毫米", _messageArray[0][@"pcpn"]];
                detailCell.rightLabel.text = @"气压";
                detailCell.rightmessLabel.text = [NSString stringWithFormat:@"%@百帕", _messageArray[0][@"pres"]];
            }
            if (indexPath.row == 4) {
                detailCell.lefttypeLabel.text = @"能见度";
                detailCell.leftmessLabel.text = [NSString stringWithFormat:@"%@公里", _messageArray[0][@"vis"]];
                detailCell.rightLabel.text = @"紫外线指数";
                detailCell.rightmessLabel.text = [NSString stringWithFormat:@"%@", _messageArray[0][@"uv_index"]];
            }
        }
        
        return detailCell;
    }
    
//    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 230;
    } else if (indexPath.section == 3){
        return 80;
    } else if (indexPath.section == 1) {
        return 150;
    } else {
        return 60;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 3) {
        return 1;
    } else if (section == 2) {
        return _weekArray.count;
    } else {
        return 5;
    }
    
}

- (void)getcityName:(NSString *)Name {
    
    self.cityName = Name;
    [self creatDataTask];
    [self creatTableView];
    
}

-(void)datareloadData {
    [_tableView reloadData];
}
    
    
@end
    
