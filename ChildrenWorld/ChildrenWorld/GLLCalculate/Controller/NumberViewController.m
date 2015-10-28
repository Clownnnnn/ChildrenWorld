//
//  NumberViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "NumberViewController.h"

@interface NumberViewController ()

@end

@implementation NumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cal.jpg"]];
    //self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.Back];
    [self.view addSubview:self.numLab];
}
#pragma mark - 懒加载
//返回button
- (UIButton *)Back
{
    if (!_Back)
    {
        _Back = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
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

- (UILabel *)numLab
{
    if (!_numLab)
    {
        CGFloat wid = self.view.frame.size.width/5;
        for (int i = 0; i<6; i++)
        {
            _numLab = [[UILabel alloc]initWithFrame:CGRectMake(8*(i+1)+wid*i, 100, wid, 40)];
            _numLab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"草莓.jpg"]];
        }
    }
    return _numLab;
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
