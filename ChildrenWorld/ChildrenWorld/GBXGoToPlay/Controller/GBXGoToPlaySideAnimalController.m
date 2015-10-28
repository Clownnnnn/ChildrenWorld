//
//  GBXGoToPlaySideAnimalController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "GBXGoToPlaySideAnimalController.h"
#import "GBXGoToPlayFlowerController.h"
#import "GBXGoToPlayVegetableController.h"
#import "GBXGoToPlayWildLifeController.h"
#import "GBXGoToPlayFruitController.h"
#import "GBXGoToPlayTreeController.h"
#import "GBXGoToPlayView.h"
#import "GBXGoToPlayItem.h"
#import "SideAnimalModel.h"

@interface GBXGoToPlaySideAnimalController ()<GBXGoToPlayViewDelegate>
{
    GBXGoToPlayView *goToPlayView;
}

@property (weak, nonatomic) IBOutlet UILabel *pageLable;
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, assign) int index;
@property (nonatomic, strong) UIView *optionView;

@end

@implementation GBXGoToPlaySideAnimalController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"身边的动物",@"野生动物",@"树木",@"花卉",@"蔬菜",@"水果"];
    goToPlayView = [[GBXGoToPlayView alloc] initWithTitleArrays:arr];
    goToPlayView.delega = self;
    [self loadData];
    [self crateOptionsBtn];
    _index = -1;
    [self nextBtnClick:nil];
    
}

#pragma mark - 数据加载
- (void)loadData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"SideAnimal" ofType:@"plist"];
    NSArray *sideAnimalArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *modelArray = [NSMutableArray array];
    for (NSDictionary *dict in sideAnimalArr) {
        SideAnimalModel *sideModelArr = [SideAnimalModel dataWithDictionary:dict];
        [modelArray addObject:sideModelArr];
    }
    _dataArr = modelArray;
}

#pragma mark - 创建备选答案按钮
- (void)crateOptionsBtn
{
    self.optionView = [[UIView alloc] initWithFrame:CGRectMake(15, 510, 345, 130)];
    [self.view addSubview:self.optionView];
    //[_optionView setBackgroundColor:[UIColor grayColor]];
    CGFloat x;
    CGFloat y;
    CGFloat width = 40;
    CGFloat height = 40;
    CGFloat leftPadding = 20;
    CGFloat centerPadding = (self.view.frame.size.width - leftPadding - 5*width)/4;
    for (int i=0; i<10; i++) {
        UIButton *btn = [[UIButton alloc]init];
        [_optionView addSubview:btn];
        x = leftPadding + (width+centerPadding)*(i%5);
        y = 15 + (height + centerPadding)*(i/5);
        btn.frame = CGRectMake(x, y, width, height);
        btn.backgroundColor = [UIColor redColor];
    }
}
- (void)settingOptionsBtn
{
    SideAnimalModel *dataArray = _dataArr[_index];
    int i=0;
    for (UIButton *btn in _optionView.subviews) {
        [btn setTitle:dataArray.optionsArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:28 weight:1];
        i++;
    }
}
- (IBAction)bigImageBtnClick:(id)sender {
        
}
- (IBAction)selectedBtnClick:(id)sender {
    [goToPlayView showMenu];
}
- (IBAction)nextBtnClick:(id)sender {
    _index++;
    SideAnimalModel *dataArray = _dataArr[_index];
    //更改页码
    if (_index == _dataArr.count-1) {
        _nextBtn.enabled = NO;
    }
    _pageLable.text = [NSString stringWithFormat:@"%i/%lu",_index+1,(unsigned long)_dataArr.count];
    //更改中心图片
    [_imageBtn setImage:[UIImage imageNamed:dataArray.iconStr] forState:UIControlStateNormal];
    //更改备选答案
    [self settingOptionsBtn];
}
- (void)GBXGoToPlayView:(UIView *)view DidChoose:(NSInteger)tag
{
    NSLog(@"%ld",(long)view.tag);
    switch (view.tag) {
        case 0:
        {
            GBXGoToPlaySideAnimalController *sideAnimal_vc = [[GBXGoToPlaySideAnimalController alloc] initWithNibName:@"GBXGoToPlaySideAnimalController" bundle:nil];
            [self presentViewController:sideAnimal_vc animated:YES completion:^{
                
            }];
        }
            break;
        case 1:
        {
            GBXGoToPlayWildLifeController *wildLife_vc = [[GBXGoToPlayWildLifeController alloc] initWithNibName:@"GBXGoToPlayWildLifeController" bundle:nil];
            [self presentViewController:wildLife_vc animated:YES completion:^{
                
            }];
        }
            break;
        case 2:
        {
            GBXGoToPlayTreeController *tree_vc = [[GBXGoToPlayTreeController alloc] initWithNibName:@"GBXGoToPlayTreeController" bundle:nil];
            [self presentViewController:tree_vc animated:YES completion:^{
                
            }];
        }
            break;
        case 3:
        {
            GBXGoToPlayFlowerController *flower_vc = [[GBXGoToPlayFlowerController alloc] initWithNibName:@"GBXGoToPlayFlowerController" bundle:nil];
            [self presentViewController:flower_vc animated:YES completion:^{
                
            }];
        }
            break;
        case 4:
        {
            GBXGoToPlayVegetableController *vegetable_vc = [[GBXGoToPlayVegetableController alloc] initWithNibName:@"GBXGoToPlayVegetableController" bundle:nil];
            [self presentViewController:vegetable_vc animated:YES completion:^{
                
            }];
        }
            break;
        case 5:
        {
            GBXGoToPlayFruitController *fruit_vc = [[GBXGoToPlayFruitController alloc] initWithNibName:@"GBXGoToPlayFruitController" bundle:nil];
            [self presentViewController:fruit_vc animated:YES completion:^{
                
            }];
        }
            break;
        default:
            break;
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
