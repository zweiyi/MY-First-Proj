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
    _scrollView.contentSize = CGSizeMake(130 * 5, 165);
    [self addSubview:_scrollView];
    
    _array = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        MyView *myView = [[MyView alloc] initWithFrame:CGRectMake( 130 * i, 0, 130, 165)];
        [_array addObject:myView];
        [_scrollView addSubview:myView];
    }
    return self;
}

- (void)getViewPhotoImageViewName:(NSArray *)photoName andName:(NSArray *)Name {
    for (int i = 0; i < 5; i++) {
        _array[i].photoImageView.image = [UIImage imageNamed:photoName[i]];
        _array[i].nameLabel.text = Name[i];
        _array[i].sellLabel.text = @"购票";
    }
}

- (void)layoutSubviews {
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 165);
}

@end
