//
//  YSHMainViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "YSHMainViewController.h"
#import "YSHSingSongViewController.h"
#import "YSHTellStoryViewController.h"
#import "YSHMainView.h"
@interface YSHMainViewController ()

@end

@implementation YSHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    YSHMainView *mainView = [[YSHMainView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:mainView];
    [mainView.singSongBtn addTarget:self action:@selector(singSongClick:) forControlEvents:UIControlEventTouchUpInside];
    [mainView.tellStoryBtn addTarget:self action:@selector(tellStoryClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)singSongClick:(UIButton *)sender
{
    
    YSHSingSongViewController *yshSingSong_VC = [[YSHSingSongViewController alloc]initWithNibName:@"YSHSingSongViewController" bundle:nil];
    [self presentViewController:yshSingSong_VC animated:YES completion:^{
        
    }];
}
- (void)tellStoryClick:(UIButton *)sender
{
    YSHTellStoryViewController *yshTellStory_VC = [[YSHTellStoryViewController alloc]initWithNibName:@"YSHTellStoryViewController" bundle:nil];
    [self presentViewController:yshTellStory_VC animated:YES completion:^{
        
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
