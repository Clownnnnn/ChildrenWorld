//
//  TwoCalViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "TwoCalViewController.h"

@interface TwoCalViewController ()

@end

@implementation TwoCalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.Back];
}
- (UIButton *)Back
{
    if (!_Back)
    {
        _Back = [[UIButton alloc]initWithFrame:CGRectMake(5, 10, 50, 50)];
        _Back.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.png"]];
        [_Back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Back;
}
#pragma mark - 点击事件
//返回点击事件
- (void)backClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        [NSThread sleepForTimeInterval:5];
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
