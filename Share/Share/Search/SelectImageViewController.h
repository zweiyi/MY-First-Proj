//
//  SelectImageViewController.h
//  Share
//
//  Created by 鳞潜羽翔 on 2019/7/30.
//  Copyright © 2019 鳞潜羽翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewCell.h"

typedef void (^ReturnImageBlock)(UIImage * _Nonnull showImage);
typedef void (^ReturnNumberBlock)(NSNumber * _Nonnull shouCnt);

NS_ASSUME_NONNULL_BEGIN

@interface SelectImageViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property UICollectionView *collectionView;
@property UICollectionViewFlowLayout *layout;
@property NSArray *imageNameArray;
@property PhotoCollectionViewCell *cell;
@property (nonatomic, retain) UIImage *firstimage;
@property NSNumber *cnt;
@property int num;
@property (nonatomic, copy) ReturnImageBlock returnImageBlock;  //定义的一个Block属性
@property (nonatomic, copy) ReturnNumberBlock returnNumberBlock;
//@property NSMutableDictionary *dictionary;
-(void)returnNumber : (ReturnNumberBlock)block;
-(void)returnImage : (ReturnImageBlock)block;
@end

NS_ASSUME_NONNULL_END
