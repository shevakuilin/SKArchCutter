//
//  ViewController.m
//  SKArchCutter
//
//  Created by shevchenko on 17/3/28.
//  Copyright © 2017年 shevchenko. All rights reserved.
//

#import "ViewController.h"
#import "SKArchCutter.h"
#import "SKTestViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (strong, nonatomic) UIView * centerView;
@property (strong, nonatomic) UIImageView * topImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.centerView = [UIView new];
    [self.view addSubview:self.centerView];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    // 切割圆角
    [SKArchCutter cuttingView:self.centerView cuttingDirection:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:self.centerView.frame.size.height / 2 borderWidth:1 borderColor:[UIColor purpleColor] backgroundColor:[UIColor redColor]];
    
    self.topImageView = [UIImageView new];
    [self.view addSubview:self.topImageView];
    self.topImageView.image = [UIImage imageNamed:@"new_loading25_400x400_@1x"];
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.centerX.equalTo(self.view);
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [SKArchCutter cuttingImageView:self.topImageView cuttingDirection:UIRectCornerAllCorners cornerRadii:self.topImageView.frame.size.height / 2 borderWidth:1 borderColor:[UIColor blackColor] backgroundColor:[UIColor clearColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
