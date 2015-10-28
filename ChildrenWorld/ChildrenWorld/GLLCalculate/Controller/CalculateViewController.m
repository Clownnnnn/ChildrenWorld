//
//  CalculateViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "CalculateViewController.h"

@interface CalculateViewController ()

@end

@implementation CalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"算术.jpg"]];
    [self buildView];
}
- (void)buildView
{
    [self.view addSubview:self.Back];
    [self.view addSubview:self.num1Lab];
    [self.view addSubview:self.addLab];
    [self.view addSubview:self.num2Lab];
    [self.view addSubview:self.equLab];
    [self.view addSubview:self.resultLab];
    [self.view addSubview:self.result1Button];
    [self.view addSubview:self.result2Button];
    [self.view addSubview:self.imaLab];
    [self.view addSubview:self.showLab];
    [self.view addSubview:self.num1ImaLab];
    [self.view addSubview:self.num2ImaLab];
    
}
#pragma mark - 懒加载
//返回键
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
        
    }];
}
//数字1
- (UILabel *)num1Lab
{
    if (!_num1Lab)
    {
        _num1Lab = [[UILabel alloc]initWithFrame:CGRectMake(25, 60, 80, 40)];
        // _num1Lab.backgroundColor = [UIColor greenColor];
        _num1Lab.text = @"6";
        _num1Lab.textAlignment = NSTextAlignmentCenter;
        self.num1Lab.font = [UIFont systemFontOfSize:36];
    }
    return _num1Lab;
}
//+号
- (UILabel *)addLab
{
    if (!_addLab)
    {
        _addLab = [[UILabel alloc]initWithFrame:CGRectMake(150, 60, 80, 40)];
        //_addLab.backgroundColor = [UIColor greenColor];
        _addLab.text = @"+";
        _addLab.textAlignment = NSTextAlignmentCenter;
        self.addLab.font = [UIFont systemFontOfSize:36];
    }
    return _addLab;
}
//数字2
- (UILabel *)num2Lab
{
    if (!_num2Lab)
    {
        _num2Lab = [[UILabel alloc]initWithFrame:CGRectMake(275, 60, 80, 40)];
        // _num2Lab.backgroundColor = [UIColor greenColor];
        _num2Lab.text = @"8";
        _num2Lab.textAlignment = NSTextAlignmentCenter;
        self.num2Lab.font = [UIFont systemFontOfSize:36];
    }
    return _num2Lab;
}
//=号
- (UILabel *)equLab
{
    if (!_equLab)
    {
        _equLab = [[UILabel alloc]initWithFrame:CGRectMake(150, 160, 80, 40)];
        //_equLab.backgroundColor = [UIColor greenColor];
        _equLab.layer.cornerRadius = 20;
        _equLab.text = @"=";
        _equLab.textAlignment = NSTextAlignmentCenter;
        self.equLab.font = [UIFont systemFontOfSize:36];
    }
    return _equLab;
}
//结果
- (UILabel *)resultLab
{
    if (!_resultLab)
    {
        _resultLab = [[UILabel alloc]initWithFrame:CGRectMake(150, 260, 80, 40)];
        _resultLab.backgroundColor = [UIColor greenColor];
        //        _resultLab.layer.borderWidth = 1;
        //        self.resultLab.layer.cornerRadius = 20;
        _resultLab.textAlignment = NSTextAlignmentCenter;
        self.resultLab.font = [UIFont systemFontOfSize:36];
    }
    return _resultLab;
}
//结果1button
- (UIButton *)result1Button
{
    if (!_result1Button)
    {
        _result1Button = [[UIButton alloc]initWithFrame:CGRectMake(60, 400, 80, 40)];
        _result1Button.backgroundColor = [UIColor redColor];
        _result1Button.layer.borderColor = [[UIColor greenColor]CGColor];
        _result1Button.layer.borderWidth = 1;
        _result1Button.layer.cornerRadius = 20;
        [_result1Button setTitle:@"14" forState:UIControlStateNormal];
        [_result1Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _result1Button.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.result1Button.titleLabel.font = [UIFont systemFontOfSize:36];
        [_result1Button addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    }
    return _result1Button;
}
//结果2button
- (UIButton *)result2Button
{
    if (!_result2Button)
    {
        _result2Button = [[UIButton alloc]initWithFrame:CGRectMake(250, 400, 80, 40)];
        _result2Button.backgroundColor = [UIColor redColor];
        _result2Button.layer.borderColor = [[UIColor greenColor]CGColor];
        _result2Button.layer.borderWidth = 1;
        _result2Button.layer.cornerRadius = 20;
        [_result2Button setTitle:@"12" forState:UIControlStateNormal];
        [_result2Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _result2Button.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.result2Button.titleLabel.font = [UIFont systemFontOfSize:36];
        [_result2Button addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    }
    return _result2Button;
}
#pragma mark - 点击事件
//结果1点击事件
- (void)click1
{
    self.resultLab.text = self.result1Button.titleLabel.text;
    self.showLab.text = @"恭喜你";
    TwoCalViewController *twoCal_VC = [[TwoCalViewController alloc]init];
    twoCal_VC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:twoCal_VC animated:YES completion:^{
        
    }];

}
//结果2点击事件
- (void)click2
{
    self.resultLab.text = self.result2Button.titleLabel.text;
    self.showLab.text = @"再试试呗";
    
}
//答对时发出声音的image
- (UILabel *)imaLab
{
    if (!_imaLab)
    {
        _imaLab = [[UILabel alloc]initWithFrame:CGRectMake(250, 300, 90, 80)];
        _imaLab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7.png"]];
        _imaLab.layer.cornerRadius = 30;
    }
    return _imaLab;
}
//显示答对了的label
- (UILabel *)showLab
{
    if (!_showLab)
    {
        _showLab = [[UILabel alloc]initWithFrame:CGRectMake(150, 320, 80, 40)];
        _showLab.backgroundColor = [UIColor greenColor];
        _showLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _showLab;
}
//数字1下面的图片
- (UILabel *)num1ImaLab
{
    if (!_num1ImaLab)
    {
        _num1ImaLab = [[UILabel alloc]initWithFrame:CGRectMake(40, 100, 55, 40)];
        _num1ImaLab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"香蕉.jpg"]];
        self.num1ImaLab.layer.cornerRadius = 10;
        
    }
    return _num1ImaLab;
}
//数字1下面的图片
- (UILabel *)num2ImaLab
{
    if (!_num2ImaLab)
    {
        _num2ImaLab = [[UILabel alloc]initWithFrame:CGRectMake(290, 100, 55, 40)];
        _num2ImaLab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"香蕉.jpg"]];
        
    }
    return _num2ImaLab;
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
