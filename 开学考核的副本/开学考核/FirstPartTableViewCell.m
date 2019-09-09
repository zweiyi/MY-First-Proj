//
//  FirstPartTableViewCell.m
//  开学考核
//
//  Created by 鳞潜羽翔 on 2019/9/8.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "FirstPartTableViewCell.h"

@implementation FirstPartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView1 = [[UIScrollView alloc] init];
    _scrollView2 = [[UIScrollView alloc] init];
    
    [self.contentView addSubview:_scrollView];
    [self.scrollView addSubview:_scrollView1];
    [self.scrollView addSubview:_scrollView2];
    
    _array = [NSMutableArray array];
    _array1 = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        MyView *myView = [[MyView alloc] initWithFrame:CGRectMake(130 * i, 0, 130, 165)];
        MyView *myView1 = [[MyView alloc] initWithFrame:CGRectMake(130 * i, 0, 130, 165)];
        [_array addObject:myView];
        [_array1 addObject:myView1];
        [_scrollView1 addSubview:myView];
        [_scrollView2 addSubview:myView1];
    }
    
    _nowButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_nowButton1 addTarget:self action:@selector(pressNow) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_nowButton1];
    
    _nowButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_nowButton2 addTarget:self action:@selector(pressNow) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_nowButton2];
    
    _mashangButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_mashangButton1 addTarget:self action:@selector(pressMashang) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_mashangButton1];
    
    _mashangButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_mashangButton2 addTarget:self action:@selector(pressMashang) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_mashangButton2];
    
    
    return self;
}

- (void)getViewPhotoImageViewName:(NSArray *)photoName andName:(NSArray *)Name {
    for (int i = 0; i < 5; i++) {
        _array[i].photoImageView.image = [UIImage imageNamed:photoName[i]];
        _array[i].nameLabel.text = Name[i];
        _array[i].sellLabel.text = @"购票";
        _array1[i].photoImageView.image = [UIImage imageNamed:photoName[5 - i - 1]];
        _array1[i].nameLabel.text = Name[5 - i - 1];
        _array1[i].sellLabel.text = @"预售";
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 2 , 200);
    _scrollView1.frame = CGRectMake(0, 35, [UIScreen mainScreen].bounds.size.width, 165);
    _scrollView2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 35, [UIScreen mainScreen].bounds.size.width, 165);
    
    _scrollView1.contentSize = CGSizeMake(130 * 5, 165);
    _scrollView2.contentSize = CGSizeMake(130 * 5, 165);
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 200);
    
    _nowButton1.frame = CGRectMake(0, 0, 100, 35);
    _nowButton2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, 100, 35);
    _mashangButton1.frame = CGRectMake(100, 0, 100, 35);
    _mashangButton2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width + 100, 0, 100, 35);
    
    [_nowButton1 setTitle:@"正在上映" forState:UIControlStateNormal];
    [_nowButton2 setTitle:@"正在上映" forState:UIControlStateNormal];
    _nowButton1.layer.borderWidth = 2;
    _nowButton1.layer.borderColor = [UIColor blackColor].CGColor;
    _nowButton2.layer.borderWidth = 2;
    _nowButton2.layer.borderColor = [UIColor blackColor].CGColor;
    
    [_mashangButton2 setTitle:@"即将上映" forState:UIControlStateNormal];
    [_mashangButton1 setTitle:@"即将上映" forState:UIControlStateNormal];
    _mashangButton1.layer.borderWidth = 2;
    _mashangButton1.layer.borderColor = [UIColor blackColor].CGColor;
    _mashangButton2.layer.borderWidth = 2;
    _mashangButton2.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)pressNow {
    _scrollView.contentOffset = CGPointMake(0, 0);
}

- (void)pressMashang {
    _scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
}
@end
