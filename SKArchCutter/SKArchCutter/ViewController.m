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

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) IBOutlet UIImageView *myCircle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SKArchCutter * archCutter = [[SKArchCutter alloc] init];
    [archCutter cuttingWithObject:self.myView direction:UIRectCornerBottomRight | UIRectCornerBottomLeft cornerRadii:10];
    [archCutter cuttingWithObject:self.myButton direction:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:10];
    [archCutter cuttingWithObject:self.myImageView direction:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:10];
    [archCutter cuttingWithObject:self.myCircle direction:UIRectCornerAllCorners cornerRadii:self.myCircle.frame.size.height / 2];
    [archCutter cuttingWithObject:self.myLabel direction:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:10];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toTest:(id)sender {
    UIViewController * testVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"test"];
    [self presentViewController:testVC animated:YES completion:nil];
}


@end
