//
//  LeadViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/14.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "LeadViewController.h"
#import "LeadView.h"
#import "AppDelegate.h"

@interface LeadViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *leadScrollView;//引导页面
@property (nonatomic, strong)UIPageControl *leadPageControl;
@property (nonatomic, strong)UIButton *button;
@end

@implementation LeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.leadScrollView];
    [self.view addSubview:self.leadPageControl];
}

#pragma mark - 懒加载
-(UIScrollView *)leadScrollView
{
    if (!_leadScrollView)
    {
        _leadScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];//初始化，设置大小为当前页面大小
        _leadScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);//设置滑动范围（3页）
        _leadScrollView.pagingEnabled = YES;//整页滑动
        _leadScrollView.directionalLockEnabled = YES;//单向滑动
        _leadScrollView.delegate = self;//设置代理
        
        //利用for循环添加每一个导航页面view
        for (int i = 0; i<3; i++) {
            LeadView *leadView = [[LeadView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height)];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
            imageView.userInteractionEnabled = YES;
            [leadView addSubview:imageView];
            [_leadScrollView addSubview:leadView];
            switch (i) {
                case 0:
                    imageView.image = [UIImage imageNamed:@"单个故事"];
                    break;
                case 1:
                    imageView.image = [UIImage imageNamed:@"单曲哥"];
                    break;
                default:
                    imageView.image = [UIImage imageNamed:@"听儿歌"];
                    [imageView addSubview:self.button];
                    break;
            }
        }
    }
    return _leadScrollView;
}


-(UIButton *)button
{
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 175, 50)];
        [_button setTitle:@"进入儿童乐园" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor redColor];
        [_button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
-(UIPageControl *)leadPageControl
{
    if (!_leadPageControl) {
        _leadPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(150, 600, 75, 30)];
        _leadPageControl.numberOfPages = 3;
        _leadPageControl.backgroundColor = [UIColor clearColor];
        _leadPageControl.pageIndicatorTintColor = [UIColor blackColor];
        _leadPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _leadPageControl;
}

-(void)clickButton:(UIButton *)button
{
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    [del changeRootController];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.leadPageControl.currentPage = self.leadScrollView.contentOffset.x/self.view.frame.size.width;
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
