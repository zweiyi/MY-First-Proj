//
//  SelectImageViewController.m
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import "SelectImageViewController.h"
#import "PhotoCollectionViewCell.h"

@interface SelectImageViewController ()

@end

@implementation SelectImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:_layout];
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    _layout.itemSize = CGSizeMake(130, 150);
    _layout.minimumLineSpacing = 5;
    _layout.minimumInteritemSpacing = 5;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"Ccell"];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _imageNameArray = @[@"非正.jpg", @"白.jpg", @"小白.jpg", @"功必扬.jpg", @"家教.jpg", @"伦.jpg", @"宁大人.jpg", @"女装左右.jpg", @"萨沙.jpg", @"萨沙1.jpg", @"土豆.jpg", @"扬扬.jpg", @"钟逸伦.jpg", @"左右.jpg", @"00.jpg" ];
    
    _firstimage = [UIImage imageNamed:@"非正.jpg"];
//    _dictionary = [[NSMutableDictionary alloc] init];
    
    UIBarButtonItem *upBarButton = [[UIBarButtonItem alloc] init];
    upBarButton.title = @"上传";
    upBarButton.tintColor = [UIColor whiteColor];
    [upBarButton setTarget:self];
    [upBarButton setAction:@selector(pressUP)];
    self.navigationItem.rightBarButtonItem = upBarButton;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.05 green:0.4 blue:0.74 alpha:1.0];
    _num = 0;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 15;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    _cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"Ccell" forIndexPath:indexPath];
    
    _cell.photoButton.tag = 100 + indexPath.item;
    [_cell.photoButton addTarget:self action:@selector(pressSelected : and: ) forControlEvents:UIControlEventTouchUpInside];
    
    _cell.photoImageView.image = [UIImage imageNamed:_imageNameArray[indexPath.item]];
    
  
    return _cell;
    
}

-(void)pressUP {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认上传所选内容" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction  actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        [self.navigationController popViewControllerAnimated:NO];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
     [alertController addAction:sureAction];
    [alertController addAction:cancelAction];
   
    
    [self presentViewController:alertController animated:YES completion:nil];
}


//把传进来的block语句保存到本类的实例变量returnImageBlock （.h中定义的属性）中，然后找一个时机调用
- (void)returnImage:(ReturnImageBlock)block {
    self.returnImageBlock = block;
}

-(void)returnNumber:(ReturnNumberBlock)block {
    self.returnNumberBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated {
    _cnt = @(_num);
    if (self.returnImageBlock != nil) {
        self.returnImageBlock(self.firstimage);
    }
    if (self.returnNumberBlock != nil) {
        self.returnNumberBlock(self.cnt);
    }
}

-(void)pressSelected : (UIButton *) btn and : (UIImageView *)imageView {
    
    if (btn.selected == YES) {
      UIImageView *imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"my_button_pressed.png"]];
        imageView.frame = CGRectMake(110, 0, 20, 20);
        [btn addSubview:imageView];
        btn.selected = NO;
        _num = _num + 1;
    } else {
        [btn.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        btn.selected = YES;
        _num = _num - 1;
    }
    
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if (_cell.isSelect == YES) {
//        NSLog(@"yes");
//        UIImageView *imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"my_button_pressed.png"]];
//        imageView.frame = CGRectMake(110, 0, 20, 20);
//        [_cell.photoImageView addSubview:imageView];
//        _cell.isSelect = NO;
//    } else {
//        NSLog(@"no");
//        [_cell.photoImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        _cell.isSelect = YES;
//    }
//}
@end
