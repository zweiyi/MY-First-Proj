//
//  CatMainViewController.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "CatMainViewController.h"
#import "LittleTableViewCell.h"
#import "Little2TableViewCell.h"
#import "FirstPartTableViewCell.h"

@interface CatMainViewController ()

@end

@implementation CatMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 300)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *addLabel = [[UILabel alloc] init];
    addLabel.text = @"西安";
    addLabel.frame = CGRectMake(0, 0, 50, 30);
    addLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:addLabel];
    
    UITextField *searchTextField = [[UITextField alloc] init];
    searchTextField.frame = CGRectMake(60, 0, 300, 30);
    searchTextField.placeholder = @"找影视剧，影人，影院，演出，图书";
    searchTextField.layer.borderColor = [UIColor grayColor].CGColor;
    searchTextField.layer.borderWidth = 1;
    searchTextField.layer.cornerRadius = 10;
    [view addSubview:searchTextField];
    
    UIImageView *middleImageView = [[UIImageView alloc] init];
    middleImageView.image = [UIImage imageNamed:@"middle.png"];
    middleImageView.frame = CGRectMake(0, 30, 414, 270);
    [view addSubview:middleImageView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tableView.tableHeaderView = view;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[LittleTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[Little2TableViewCell class] forCellReuseIdentifier:@"cell2"];
    [_tableView registerClass:[FirstPartTableViewCell class] forCellReuseIdentifier:@"cell3"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _data1Array = @[@"非正11.jpg", @" 非正233.jpg", @"非正11.jpg", @" 非正233.jpg", @"非正1.jpg"];
    _data2Array = @[@"罗小黑战记", @"速度与激情", @"哪吒之魔童", @"烈火英雄", @"沉默的证人"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FirstPartTableViewCell *cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        [cell3 getViewPhotoImageViewName:_data1Array andName:_data2Array];
        return cell3;
    }else  {
        if (indexPath.row  % 2) {
            LittleTableViewCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
            cell1.messageLabel.text = @"《我在未来等你》“17岁”vs“37岁”， 直面史上最大反差观剧团";
            cell1.photoimageView.image = [UIImage imageNamed:@" 非正233.jpg"];
            return cell1;
        } else {
            Little2TableViewCell *cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
            cell2.messageLabel.text = @"高燃！“最强联盟”生死同为国冲顶";
            cell2.photoimageView1.image = [UIImage imageNamed:@"非正11.jpg"];
            cell2.photoimageView2.image = [UIImage imageNamed:@"非正11.jpg"];
            cell2.photoimageView3.image = [UIImage imageNamed:@"非正11.jpg"];
            return cell2;
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    } else {
        return 250;
       
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    } else {
        return 10;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

@end
