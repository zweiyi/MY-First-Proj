//
//  SearchViewController1.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SearchViewController1.h"
#import "ZWYTableViewCell4.h"
#import "UploadViewController1.h"


@interface SearchViewController1 ()

@end

@implementation SearchViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 120, [UIScreen mainScreen].bounds.size.width, 600) style:UITableViewStylePlain];
    [_tableView registerClass:[ZWYTableViewCell4 class] forCellReuseIdentifier:@"cell2333"];
    _tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_tableView];
    
    _searchedTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 384, 50)];
    _searchedTextField.placeholder = @"搜索用户名作品分类文章";
    _searchedTextField.text = @"大白";
    _searchedTextField.enabled = YES;
    UIImageView *searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"放大镜.png"]];
    searchImageView.frame = CGRectMake(0, 0, 30, 30);
    _searchedTextField.leftViewMode = UITextFieldViewModeAlways;
    _searchedTextField.leftView = searchImageView;
    _searchedTextField.layer.cornerRadius = 5;
    _searchedTextField.layer.borderWidth = 2;
    _searchedTextField.layer.borderColor = [UIColor grayColor].CGColor;
    
    _searchedTextField.delegate = self;
    [self.view addSubview:_searchedTextField];
    
    _dataArray = @[@[@"lcon of Baymax", @"每个人生都需要一个大白"], @[@"share小白", @"share小王"], @[@"原创-UI-icon15分钟前", @"原创作品-摄影1个月前"], @[@"大白.jpeg", @"大白2.jpeg"]];
    
    _searchedTextField.delegate = self;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWYTableViewCell4 *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell2333" forIndexPath:indexPath];
    cell.nameLabel.text = _dataArray[0][indexPath.section];
    cell.authorLabel.text = _dataArray[1][indexPath.section];
    cell.noteLabel.text = _dataArray[2][indexPath.section];
    cell.noteLabel.numberOfLines = 0;
//    cell.likeLabel.text = @"102";

    
    NSString *str = _dataArray[3][indexPath.section];
    cell.leftImageView.image = [UIImage imageNamed:str];
                                
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @" ";
    } else {
        return @"";
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}




@end
