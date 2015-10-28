//
//  MainViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/14.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "MainViewController.h"
#import "MainImageView.h"
#import "LMKMainViewController.h"
#import "MainChooseButton.h"
#import "GBXGoToPlayFlowerController.h"
#import "GLLMainViewController.h"
#import "YSHMainViewController.h"

@interface MainViewController ()
@property (nonatomic, strong)MainImageView *imageView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.imageView];
    
}
-(MainImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[MainImageView alloc]initWithFrame:self.view.frame];
        
        MainChooseButton *ListenButton = [[MainChooseButton alloc]initWithFrame:CGRectMake(120, 225, 150, 45)];
        MainChooseButton *EnglishButton = [[MainChooseButton alloc]initWithFrame:CGRectMake(145, 283, 100, 40)];
        MainChooseButton *CalculButton = [[MainChooseButton alloc]initWithFrame:CGRectMake(145, 338, 100, 40)];
        MainChooseButton *DrawButton = [[MainChooseButton alloc]initWithFrame:CGRectMake(145, 395, 100, 40)];
        MainChooseButton *PlayButton = [[MainChooseButton alloc]initWithFrame:CGRectMake(145, 450, 100, 40)];
        
        [_imageView addSubview:ListenButton];
        [_imageView addSubview:EnglishButton];
        [_imageView addSubview:CalculButton];
        [_imageView addSubview:DrawButton];
        [_imageView addSubview:PlayButton];
        
        [ListenButton addTarget:self action:@selector(clickListenButton:) forControlEvents:UIControlEventTouchUpInside];
        [EnglishButton addTarget:self action:@selector(clickEnglishButton:) forControlEvents:UIControlEventTouchUpInside];
        [CalculButton addTarget:self action:@selector(clickCalculButton:) forControlEvents:UIControlEventTouchUpInside];
        [DrawButton addTarget:self action:@selector(clickDrawButton:) forControlEvents:UIControlEventTouchUpInside];
        [PlayButton addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _imageView;
}
-(void)clickListenButton:(UIButton *)sender
{
    YSHMainViewController *ysh_vc = [[YSHMainViewController alloc]initWithNibName:@"YSHMainViewController" bundle:nil];
    [self presentViewController:ysh_vc animated:YES completion:^{
        
    }];
}
-(void)clickEnglishButton:(UIButton *)sender
{
    LMKMainViewController *lmk_vc = [[LMKMainViewController alloc]initWithNibName:@"LMKMainViewController" bundle:nil];
    [self presentViewController:lmk_vc animated:YES completion:^{
        
    }];
}
-(void)clickCalculButton:(UIButton *)sender
{
    GLLMainViewController *gll_vc = [[GLLMainViewController alloc]initWithNibName:@"GLLMainViewController" bundle:nil];
    [self presentViewController:gll_vc animated:YES completion:^{
        
    }];
}
-(void)clickDrawButton:(UIButton *)sender
{
    LMKMainViewController *lmk_vc = [[LMKMainViewController alloc]initWithNibName:@"LMKMainViewController" bundle:nil];
    [self presentViewController:lmk_vc animated:YES completion:^{
        
    }];
}
-(void)clickPlayButton:(UIButton *)sender
{
    GBXGoToPlayFlowerController *gbx_vc = [[GBXGoToPlayFlowerController alloc]initWithNibName:@"GBXGoToPlayFlowerController" bundle:nil];
    [self presentViewController:gbx_vc animated:YES completion:^{
        
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
