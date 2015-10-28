//
//  GLLMainViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "GLLMainViewController.h"
#import "CalculateViewController.h"
#import "NumberViewController.h"
@interface GLLMainViewController ()

@end

@implementation GLLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"算术1.jpg"]];
    [self.view addSubview:self.calButton];
    [self.view addSubview:self.numButton];
    [self.view addSubview:self.back];
}

#pragma mark - 懒加载
- (UIButton *)numButton
{
    if (!_numButton)
    {
        _numButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 150, 100, 40)];
        [_numButton setTitle:@"认识数字" forState:UIControlStateNormal];
        [_numButton setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
        _numButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_numButton addTarget:self action:@selector(numberClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _numButton;
}
- (UIButton *)calButton
{
    if (!_calButton)
    {
        _calButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 350, 100, 40)];
        [_calButton setTitle:@"加减算法" forState:UIControlStateNormal];
        [_calButton setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
        _calButton.titleLabel.font = [UIFont systemFontOfSize:24];
        [_calButton addTarget:self action:@selector(calculateClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _calButton;
}
//返回button
- (UIButton *)back
{
    if (!_back)
    {
        _back = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        _back.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.png"]];
        [_back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _back;
}

#pragma mark - 点击事件
- (void)calculateClick
{
    CalculateViewController *calculate_VC = [[CalculateViewController alloc]init];
    calculate_VC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:calculate_VC animated:YES completion:^{
        
    }];
}
- (void)numberClick
{
    NumberViewController *number_VC = [[NumberViewController alloc]init];
    number_VC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:number_VC animated:YES completion:^{
        
    }];
}
- (void)backClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        
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
