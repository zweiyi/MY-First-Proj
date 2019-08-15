//
//  TalkViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/8/1.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "TalkViewController.h"
#import "ZWYTableViewCell.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)

static NSString *cellInIdentifier = @"talkcell";
@interface TalkViewController ()

@end

@implementation TalkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SHARE";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    _tableView.backgroundColor  = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[ZWYTableViewCell class] forCellReuseIdentifier:cellInIdentifier];
    [self.view addSubview:_tableView];
    
    _messgeTextField = [[UITextField alloc] init];
    _messgeTextField.frame = CGRectMake(0, 0, WIDTH - 20, 45);
    _messgeTextField.borderStyle = UITextBorderStyleRoundedRect;
    _messgeTextField.layer.borderWidth = 2;
    _messgeTextField.layer.borderColor = [UIColor blackColor].CGColor;
    _messgeTextField.delegate = self;
    [self.view addSubview:_messgeTextField];
    
    UIButton *sendButton = [[UIButton alloc] init];
    sendButton.frame = CGRectMake(0, 0,  50, 45);
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendButton.backgroundColor = [UIColor orangeColor];
    [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    _messgeTextField.rightViewMode = UITextFieldViewModeAlways;
    _messgeTextField.rightView = sendButton;
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 60, WIDTH, 60)];
    bottomView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [self.view addSubview:bottomView];
    [bottomView addSubview:_messgeTextField];
    
    _messageArray = [NSMutableArray arrayWithObjects:@"你拍的真不错！", @"谢谢，已关注你", @"好专业的照片，非常喜欢", @"nice", nil];
    _imageArray = @[@"非正2.jpg", @"非正4.jpg"];
    _dataArray = [NSMutableArray array];
    [self creatData:_messageArray];
    
    //键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)creatData :(NSMutableArray *)messageArray {
    for (NSString *str  in messageArray) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        CGFloat labheight = [self getWidth:WIDTH / 2 title:str font:[UIFont systemFontOfSize:30]];
        [dic setValue:[NSString stringWithFormat:@"%f", self.view.frame.size.width] forKey:@"cellwidth"];
        [dic setValue:[NSString stringWithFormat:@"%f", labheight] forKey:@"labheight"];
        CGFloat height;
        if (labheight  > 30) {
            height = labheight + 30 ;
        } else {
            height = 50.0;
        }
        //cell总高度
        [dic setValue:[NSString stringWithFormat:@"%f", height] forKey:@"cellheight"];
        [dic setValue:str forKey:@"info"];
        [_dataArray addObject:dic];
    }
}

-(CGFloat)getWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    //自适应
    label.numberOfLines = 0;
    [label sizeToFit];
    //经过自适应之后的label,已经有新的高度
    CGFloat height = label.frame.size.height;
    
    return height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tableView.contentSize.height > self.tableView.frame.size.height - 500) {
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height + 500);
        NSLog(@"开始%f", tableView.contentOffset.y);
        [self.tableView setContentOffset:offset animated:YES];
        NSLog(@"相减%f", offset.y);
        NSLog(@"之后%f", tableView.contentOffset.y);
    }
    return  _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWYTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellInIdentifier forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        [cell getImageName:@"非正2.jpg" getLabelInfo:[[_dataArray objectAtIndex:indexPath.row] objectForKey: @"info"] getHeight:[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"labheight"]  andIndexpath:indexPath];
    } else {
        [cell getImageName:@"非正4.jpg" getLabelInfo:[[_dataArray objectAtIndex:indexPath.row] objectForKey: @"info"] getHeight:[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"labheight"]  andIndexpath:indexPath];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"cellheight"]floatValue];
}

-(void)send {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:_messgeTextField.text];
//    [array addObject:_messgeTextField.text];
    
    [self creatData:array];
    [_tableView reloadData];
    _messgeTextField.text = @"";
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_dataArray.count - 1) inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_messgeTextField resignFirstResponder];
    return YES;
}

-(void)keyboardWillShow : (NSNotification *)notify {
    CGFloat kbHeight = [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    CGFloat offset = kbHeight;
    
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

-(void)keyboardWillHide: (NSNotification *)notify {
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
