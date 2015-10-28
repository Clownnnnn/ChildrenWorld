//
//  YSHTellStoryViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "YSHTellStoryViewController.h"
#import "YSHTellStoryView.h"
@interface YSHTellStoryViewController ()
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation YSHTellStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    YSHTellStoryView *tellStoryView = [[YSHTellStoryView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:tellStoryView];
    [tellStoryView.button addTarget:self action:@selector(tellStoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tellStoryBtnClick:(UIButton *)button
{
    if (button.tag == 1) {
        
    }
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
