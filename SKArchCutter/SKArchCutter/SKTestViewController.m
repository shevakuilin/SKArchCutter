//
//  SKTestViewController.m
//  SKArchCutter
//
//  Created by shevchenko on 17/3/28.
//  Copyright © 2017年 shevchenko. All rights reserved.
//

#import "SKTestViewController.h"
#import "SKArchCutter.h"

@interface SKTestViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) SKArchCutter * archCutter;

@end

@implementation SKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.tableFooterView = [UIView new];
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.archCutter = [[SKArchCutter alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:@"new_loading25_400x400_@1x"];
    [self.archCutter cuttingWithObject:cell.imageView.image direction:UIRectCornerAllCorners cornerRadii:10];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}



@end
