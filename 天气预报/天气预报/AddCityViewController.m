//
//  AddCityViewController.m
//  天气预报
//
//  Created by 鳞潜羽翔 on 2019/8/12.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "AddCityViewController.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface AddCityViewController ()

@end

@implementation AddCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yun.jpg"]];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _addTextField = [[UITextField alloc] init];
    _addTextField.frame = CGRectMake(0, H * 0.05, W, H * 0.05);
    [self.view addSubview:_addTextField];
    _addTextField.borderStyle = UITextBorderStyleRoundedRect;
    _addTextField.delegate = self;
    _addTextField.layer.borderWidth = 1;
    _addTextField.layer.cornerRadius = 10;
    _addTextField.backgroundColor = [UIColor clearColor];
    _addTextField.textColor = [UIColor whiteColor];
    _addTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _addTextField.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *addCityButton = [[UIButton alloc] init];
    addCityButton.frame = CGRectMake(0, 0, W / 8, H * 0.05);
//    [addCityButton setImage:[UIImage imageNamed:@"放大镜.png"] forState:UIControlStateNormal];
    [addCityButton setTitle:@"返回" forState:UIControlStateNormal];
    addCityButton.titleLabel.font = [UIFont systemFontOfSize:24];
    [addCityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addCityButton addTarget:self action:@selector(backhome) forControlEvents:UIControlEventTouchUpInside];
    _addTextField.rightView = addCityButton;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, H * 0.1, W, H * 0.95) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"citycell"];
    
     _seachcityArray = [NSMutableArray array];
    
    [self dataTask];
}

-(void) dataTask {
    NSString *urlString = [NSString stringWithFormat:@"https://search.heweather.net/find?location=%@&&key=8a1ea338b1c2465488be872925af3be8", _addTextField.text];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *array = objc[@"HeWeather6"][0][@"basic"];
            if (self->_seachcityArray) {
                [self->_seachcityArray removeAllObjects];
            }
            for (int i = 0; i < array.count; i++) {
                [self->_seachcityArray addObject:array[i][@"location"]];
            }
            [self performSelectorOnMainThread:@selector(reloadtableView) withObject:self waitUntilDone:NO];
            
        }
    }];
    [dataTask resume];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"citycell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    if (_seachcityArray.count) {
        cell.textLabel.text = _seachcityArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:30];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _seachcityArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self dataTask];
    return YES;
}

-(void)reloadtableView {
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL ishave = NO;
    for (NSString *str in _cityNameArray) {
        if ([str isEqualToString:_seachcityArray[indexPath.row]]) {
            ishave = YES;
            break;
        }
    }
    if (ishave) {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"该城市已在列表中了" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:sureAction];
//
//
//        [self presentViewController:alertController animated:NO completion:nil];
        
         [self dismissViewControllerAnimated:NO completion:nil];
        
//        [self performSelector:@selector(alertdis:) withObject:alertController afterDelay:3];
        
        _addTextField.text = @"";
        
    } else {
        _addTextField.text = _seachcityArray[indexPath.row];
        if ([self.cityDelegate respondsToSelector:@selector(passCityName:)]) {
            [self.cityDelegate passCityName:_seachcityArray[indexPath.row]];
        }
       [self dismissViewControllerAnimated:NO completion:nil];
    }
    
}



-(void)backhome {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
