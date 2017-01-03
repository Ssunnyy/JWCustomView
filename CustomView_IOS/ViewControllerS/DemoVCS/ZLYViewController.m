//
//  ZLYViewController.m
//  ZLYWaterWave
//
//  Created by 周凌宇 on 16/4/22.
//  Copyright © 2016年 周凌宇. All rights reserved.
//

#import "ZLYViewController.h"
#import "ZLYWaterWave.h"

#define kSCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define kSCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface ZLYViewController () <ZLYWaterWaveDelegate>

/** 白色图片 */
@property (nonatomic, weak  ) UIImageView *pic_white;
/** 红色图片 */
@property (nonatomic, weak  ) UIImageView *pic_red;
/** 水波工具 */
@property (nonatomic, strong) ZLYWaterWave *waterWave;

@end

@implementation ZLYViewController

#pragma mark - ========================Life Cycle========================
- (void)viewDidLoad {
    [super viewDidLoad];
    [self pic_white];
    [self pic_red];
    [self waterWave];
    self.waterWave.waterDepth = 0.5;
    
}

#pragma mark - ========================ZLYWaterWave Delegate========================
- (void)waterWave:(ZLYWaterWave *)waterWave wavePath:(UIBezierPath *)path {
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = path.CGPath;
    self.pic_red.layer.mask = maskLayer;
}

#pragma mark - ========================Getter Setter========================
- (ZLYWaterWave *)waterWave {
    if (_waterWave == nil) {
        CGRect frame = CGRectMake(self.pic_red.x, self.pic_red.y, self.pic_red.width, self.pic_red.height);
        _waterWave = [[ZLYWaterWave alloc] initWithFrame:frame];
        _waterWave.delegate = self;
    }
    return _waterWave;
}

- (UIImageView *)pic_white {
    if (_pic_white == nil) {
        UIImageView *pic_white = [[UIImageView alloc] init];
        pic_white.frame        = CGRectMake((kSCREEN_WIDTH - 150) / 2, (kSCREEN_HEIGHT - 150) / 2, 150, 150);
        pic_white.image        = [UIImage imageNamed:@"pic_white"];
        [self.view addSubview:pic_white];
        _pic_white             = pic_white;
    }
    return _pic_white;
}

- (UIImageView *)pic_red {
    if (_pic_red == nil) {
        UIImageView *pic_red = [[UIImageView alloc] init];
        pic_red.frame        = self.pic_white.frame;
        pic_red.image        = [UIImage imageNamed:@"pic_red"];
        [self.view addSubview:pic_red];
        _pic_red             = pic_red;
    }
    return _pic_red;
}


@end
