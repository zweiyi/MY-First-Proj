//
//  ManageCityViewController.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/13.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "ManageCityViewController.h"
#import "AddTableViewCell.h"
#import "AddCityViewController.h"
#import "CityDataTableViewCell.h"

@interface ManageCityViewController ()
@end

@implementation ManageCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yun.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[CityDataTableViewCell class] forCellReuseIdentifier:@"cityCell"];
    [_tableView registerClass:[AddTableViewCell class] forCellReuseIdentifier:@"bootomCell"];
    
    
    _tableView.tableFooterView = [[UIView alloc] init];
    
    _cityDataDictionary = [NSMutableDictionary dictionary];
    _cityDateDictionary = [NSMutableDictionary dictionary];
    
    [self dataload];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CityDataTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
        cell.cityNameLabel.text = _cityNameArray[indexPath.row];
        if (_cityDataDictionary.count == _cityNameArray.count  && _cityDateDictionary.count == _cityNameArray.count) {
            cell.temLabel.text = _cityDataDictionary[_cityNameArray[indexPath.row]];
            NSMutableString *str = [NSMutableString stringWithFormat:@"%@", _cityDateDictionary[_cityNameArray[indexPath.row]]];
            [str deleteCharactersInRange:NSMakeRange(0, 11)];
            cell.dateLabel.text = str;
        }
       
        return cell;
    } else {
        AddTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"bootomCell" forIndexPath:indexPath];
        [cell.addButton addTarget:self action:@selector(addCity) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _cityNameArray.count;
    } else {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90;
    } else {
        return 60;
    }
}

-(void)addCity {
    AddCityViewController *addCityViewController = [[AddCityViewController alloc] init];
    addCityViewController.cityNameArray = _cityNameArray;
    addCityViewController.cityDelegate = self;
    [self presentViewController:addCityViewController animated:NO completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        if ([self.cityNameDelegate respondsToSelector:@selector(passCityTag:)]) {
            [self.cityNameDelegate passCityTag:indexPath.row];
        }
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)passCityName:(NSString *)cityName {
    
    [_cityNameArray addObject:cityName];
    
    [self dataload];
    
    [_tableView reloadData];
    
}

-(void)dataload {
    for (int i = 0; i < _cityNameArray.count; i++) {
        [self creatData:i];
    }
}

-(void)creatData: (int) i {
    NSString *urlString = [NSString stringWithFormat:@"https://free-api.heweather.net/s6/weather?location=%@&key=8a1ea338b1c2465488be872925af3be8", _cityNameArray[i]];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            
            id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([objc[@"HeWeather6"][0][@"status"] isEqualToString:@"ok"]) {
                NSString  *dataString = objc[@"HeWeather6"][0][@"update"][@"loc"];
                
                NSString *tempString = objc[@"HeWeather6"][0][@"now"][@"tmp"];
                [self->_cityDataDictionary setObject:tempString forKey:self->_cityNameArray[i]];
                [self->_cityDateDictionary setValue:dataString forKey:self->_cityNameArray[i]];
                [self performSelectorOnMainThread:@selector(datareload) withObject:self waitUntilDone:NO];
//            }
            } else {
                NSString *str = self->_cityNameArray[i];
                [self->_cityNameArray removeObject:str];
                [self performSelectorOnMainThread:@selector(datareload) withObject:self waitUntilDone:NO];
            }
            

        }
    }];
    
    [dataTask resume];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) datareload {
    [_tableView reloadData];
}


@end
