//
//  UploadViewController1.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "UploadViewController1.h"
#import "SelectImageViewController.h"

@interface UploadViewController1 ()

@end

@implementation UploadViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _selectImageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _selectImageButton.frame = CGRectMake(10, 80, 240, 140);
    [_selectImageButton setTitle:@"选择图片" forState:UIControlStateNormal];
//    [_selectImageButton setImage:[UIImage imageNamed:@"dizhi.png"] forState:UIControlStateNormal];
//    _selectImageButton.titleLabel.text = @"选择图片";
    _selectImageButton.tintColor = [UIColor whiteColor];
    _selectImageButton.backgroundColor = [UIColor grayColor];
    [_selectImageButton addTarget:self action:@selector(pressSelectImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_selectImageButton];
    
    UIImageView *addressImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dizhi.png"]];
    addressImageView.frame = CGRectMake(280, 120, 20, 20);
    [self.view addSubview:addressImageView];
    
    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.text = @"陕西省，西安市";
    addressLabel.textAlignment = NSTextAlignmentCenter;
    addressLabel.font = [UIFont systemFontOfSize:10];
    addressLabel.textColor = [UIColor whiteColor];
    addressLabel.backgroundColor = [UIColor colorWithRed:0 green:0.57 blue:0.86 alpha:1.0];
    addressLabel.layer.masksToBounds = YES;
    addressLabel.layer.borderWidth = 0;
    addressLabel.layer.cornerRadius = 10;
    addressLabel.frame = CGRectMake(310, 120, 80, 20);
    [self.view addSubview:addressLabel];
    
    
    NSArray *btnStrArray = @[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他"];
    for (int i = 0; i < 8; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        NSString *str = btnStrArray[i];
        [btn setTitle: str forState:UIControlStateNormal];
        btn.tintColor = [UIColor blackColor];
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
        if (i < 4) {
            btn.frame = CGRectMake(10 + 100 * i, 250, 80, 30);
        } else {
            btn.frame = CGRectMake(10 + 100 * (i - 4), 290, 80, 30);
        }
        [self.view addSubview:btn];
    }
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.placeholder = @"   作品名称";
    _nameTextField.frame = CGRectMake(0, 340, [UIScreen mainScreen].bounds.size.width, 30);
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.layer.borderWidth = 1;
    _nameTextField.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_nameTextField];
    
    _messageTextView = [[UITextView alloc] init];
//    _messageTextView.text = @"请添加作品说明/文章内容";
    _messageTextView.frame = CGRectMake(0, 380, [UIScreen mainScreen].bounds.size.width, 150);
    _messageTextView.layer.masksToBounds = YES;
    _messageTextView.layer.borderWidth = 1;
    _messageTextView.layer.borderColor = [UIColor blackColor].CGColor;
    _messageTextView.delegate = self;
    [self.view addSubview:_messageTextView];
    
    _messPlaceHoderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 300, 20)];
    _messPlaceHoderLabel.text = @"请添加作品说明/文章内容";
    _messPlaceHoderLabel.font = [UIFont systemFontOfSize:18];
    _messPlaceHoderLabel.textColor = [UIColor colorWithRed:0.79 green:0.78 blue:0.80 alpha:1];
    [_messageTextView addSubview:_messPlaceHoderLabel];
    
    
    _sharButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sharButton setTitle:@"发布" forState:UIControlStateNormal];
    _sharButton.titleLabel.font = [UIFont systemFontOfSize:24];
    _sharButton.tintColor = [UIColor whiteColor];
    _sharButton.backgroundColor = [UIColor colorWithRed: 0 green:0.57 blue:0.86 alpha:1.0];
    _sharButton.frame = CGRectMake(10, 540, 384, 40);
    [_sharButton addTarget:self action:@selector(pressShare) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sharButton];
    
    UIButton *checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkButton setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    checkButton.frame = CGRectMake(10, 590, 20, 20);
    checkButton.tag = 100;
    checkButton.selected = YES;
    checkButton.backgroundColor = [UIColor clearColor];
    [checkButton addTarget:self action:@selector(pressCheck:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkButton];
    
    UILabel *checkLabel = [[UILabel alloc] init];
    checkLabel.text = @"禁止下载";
    checkLabel.frame = CGRectMake(38, 595, 80, 10);
    checkLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:checkLabel];
    
    
    _isOpen = NO;
    _openButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_openButton setImage:[UIImage imageNamed:@"展开.png"] forState:UIControlStateNormal];
    _openButton.frame = CGRectMake(380, 160, 20, 30);
    [_openButton addTarget:self action:@selector(pressOpen) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_openButton];
    
    _tableview = [[UITableView alloc] init];
    _tableview.frame = CGRectMake(260, 160, 120, 30);
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"littleCell"];
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"little2Cell"];

    [self.view addSubview:_tableview];

    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    _dataArray  = [[NSMutableArray alloc] init];
    [_dataArray addObject:@"原创作品"];
    [_dataArray addObject: @"设计资料"];
    [_dataArray addObject:@"设计师观点"];
    [_dataArray addObject:@"设计教程"];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_isOpen) {
        UITableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"little2Cell" forIndexPath:indexPath];
        cell.textLabel.text = _dataArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        return cell;
    } else {
        UITableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"littleCell" forIndexPath:indexPath];
        cell.textLabel.text = _dataArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        return cell;
    }
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isOpen) {
        return 4;
    } else {
        return 1;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)viewDidAppear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
}


-(void)pressSelect : (UIButton *)btn {
    btn.tintColor = [UIColor whiteColor];
    btn.backgroundColor = [UIColor colorWithRed:0.16 green:0.6 blue:0.8 alpha:1.0 ];
    [btn addTarget:self action:@selector(pressUnSelect :) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressUnSelect : (UIButton *)btn {
    btn.tintColor = [UIColor blackColor];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(pressSelect :) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressSelectImage {
    UIBarButtonItem *bBarButtonItem = [[UIBarButtonItem alloc] init];
    bBarButtonItem.tintColor = [UIColor whiteColor];
    bBarButtonItem.title = @"上传图片";
    self.navigationItem.backBarButtonItem = bBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back_img.png"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_img.png"]];
    SelectImageViewController *selectImageViewController = [[SelectImageViewController alloc] init];
    
   
    
    //回调方法
    [selectImageViewController returnImage:^(UIImage *image) {
//        self->_selectImageButton.imageView.image = image;
//        [self->_selectImageButton setImage:image forState:UIControlStateNormal];
        
        [self->_selectImageButton setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//        self->_selectImageButton.backgroundColor = [UIColor colorWithPatternImage:image];
        
        [self->_selectImageButton setTitle:nil forState:UIControlStateNormal];
//        [self->_selectImageButton removeFromSuperview];
//        self->_imageView = [[UIImageView alloc] init];
//        self->_imageView.frame = CGRectMake(10, 80, 240, 140);
//        self->_imageView.image = image;
//        [self.view addSubview:self->_imageView];
    }];
    [selectImageViewController returnNumber:^(NSNumber *showCnt) {
        self->_num = showCnt;
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"%@", self->_num ];
        label.frame = CGRectMake(220, 0, 20, 20);
        label.font = [UIFont systemFontOfSize:12];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor redColor];
        [self->_selectImageButton addSubview:label];
    }];
    
    
    [self.navigationController pushViewController:selectImageViewController animated:NO];
    
}
-(void)pressCheck : (UIButton *) checkButton {
    if (checkButton.selected == YES) {
        UIImage *checkedImage = [UIImage imageNamed:@"checkbox_checked.png"];
        [checkButton setImage:checkedImage forState:UIControlStateNormal];
        checkButton.selected = NO;
    } else {
        UIImage *checkImage = [UIImage imageNamed:@"checkbox_unchecked.png"];
        [checkButton setImage:checkImage forState:UIControlStateNormal];
        checkButton.selected = YES;
    }
}

-(void)pressShare {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请确认发布" message:@"请点击" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self.navigationController popViewControllerAnimated:NO];
    }];
    [alertController addAction:sureAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)pressOpen {
    if (_isOpen) {
        _tableview.frame = CGRectMake(260, 160, 120, 30);
        _isOpen = NO;
    } else {
        
        _tableview.frame = CGRectMake(260, 160, 120, 120);
        _isOpen = YES;
    }
    [_tableview reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _str =  [NSString stringWithString:_dataArray[indexPath.row]];
    [_dataArray insertObject:_str atIndex:0];
    [_dataArray removeObjectAtIndex:indexPath.row + 1];
    _isOpen = NO;
    _tableview.frame = CGRectMake(260, 160, 120, 30);
    [_tableview reloadData];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_messageTextView resignFirstResponder];
}

//刚开始要输入时，隐藏label
- (void)textViewDidBeginEditing:(UITextView *)textView {
    _messPlaceHoderLabel.hidden = YES;
}

//当输入结束后
- (void)textViewDidEndEditing:(UITextView *)textView {
    //输入为空白时，label不隐藏
    if (_messageTextView.text.length == 0) {
        _messPlaceHoderLabel.hidden = NO;
    }
}
@end
