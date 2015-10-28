//
//  LMKMainViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/16.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "LMKMainViewController.h"
#import "LMKRootsView.h"
//8 50 359 121
//8 159 359 195


@interface LMKMainViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    int animal;
    int step;
}
@property (nonatomic, strong)NSMutableDictionary *allObj;
@property (nonatomic, strong)UIScrollView *objScrollView;
@property (nonatomic, strong)UILabel *stepLabel;
@property (nonatomic, strong)UIImageView *stepImageView;
@property (nonatomic, strong)UIButton *nextBtn;
@property (nonatomic, strong)UIButton *lastBtn;
@property (nonatomic, strong)LMKRootsView *root;


@end

@implementation LMKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"draw1.png"]];
    
    self.selector1.delegate = self;
    self.selector2.delegate = self;
    self.selector3.delegate = self;
    self.selector4.delegate = self;
    self.selector5.delegate = self;
    self.selector6.delegate = self;
    self.selector7.delegate = self;
    [self.drawView addSubview:self.callCemera];
    [self.drawView addSubview:self.colorBtn];
    [self.view addSubview:self.objScrollView];
    [self.view addSubview:self.stepLabel];

}
#pragma mark --- 懒加载控件
-(UIImageView *)stepImageView
{
    if (!_stepImageView)
    {
        _stepImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 300, 165)];
        _stepImageView.userInteractionEnabled = YES;
        _stepImageView.backgroundColor = [UIColor whiteColor];
    }
    return _stepImageView;
}
-(UILabel *)stepLabel
{
    if (!_stepLabel)
    {
        _stepLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 190, 359, 165)];
        _stepLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _stepLabel.userInteractionEnabled =YES;
        [_stepLabel addSubview:self.stepImageView];
        [_stepLabel addSubview:self.nextBtn];
        [_stepLabel addSubview:self.lastBtn];
    }
    return _stepLabel;
}

-(UIScrollView *)objScrollView
{
    if (!_objScrollView)
    {
        
        _objScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(8, 50, 359, 121)];
        _objScrollView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _objScrollView.contentSize = CGSizeMake(self.view.frame.size.width*((self.allObj.allKeys.count+2)/3), 121);
        _objScrollView.directionalLockEnabled = YES;
        _objScrollView.pagingEnabled = YES;
        
        for (int i = 0; i<self.allObj.allKeys.count; i++) {
            self.root = [[LMKRootsView alloc]initWithFrame:CGRectMake(10+120*i, 10, 100, 100)];
            NSString *name = self.allObj.allKeys[i];
            NSArray *arr = self.allObj[name];
            NSString *imageStr = [NSString stringWithFormat:@"%@%lu.jpg",name,arr.count];
            
            NSLog(@"imagestr == %@",imageStr);
            self.root.imageView.image = [UIImage imageNamed:imageStr];
            self.root.label.text = name;
            [self.root.button addTarget:self action:@selector(clickRootBtn:) forControlEvents:UIControlEventTouchUpInside];
            self.root.button.tag = 100+i;
            NSLog(@"tag == %ld",(long)self.root.button.tag);
            NSLog(@"%@",name);
            [_objScrollView  addSubview:self.root];
        }
        
        
    }
    return _objScrollView;
}

-(UIButton *)nextBtn
{
    if (!_nextBtn)
    {
        _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(310, 60, 40, 40)];
        _nextBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_right.png"]];
        _nextBtn.hidden = YES;
        [_nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

-(UIButton *)lastBtn
{
    if (!_lastBtn)
    {
        _lastBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 60, 40, 40)];
        _lastBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_left"]];
        _lastBtn.hidden = YES;
        [_lastBtn addTarget:self action:@selector(clickLastBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lastBtn;
}

-(UIButton *)colorBtn
{
    if (!_colorBtn)
    {
        _colorBtn = [[UIButton alloc]initWithFrame:CGRectMake(250, 0, 40, 40)];
        _colorBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_color"]];
        [_colorBtn addTarget:self action:@selector(clickColorBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _colorBtn;
}
-(UIButton *)callCemera
{
    if (!_callCemera)
    {
        _callCemera = [[UIButton alloc]initWithFrame:CGRectMake(300, 0, 40, 40)];
        _callCemera.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cemera"]];
        //        [_callCemera setTitle:@"相机" forState:UIControlStateNormal];
        //        [_callCemera setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [_callCemera addTarget:self action:@selector(callCemera:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _callCemera;
}

#pragma mark -- 初始化字典
-(NSMutableDictionary *)allObj
{
    if (!_allObj)
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Sketch" ofType:@"plist"];
        _allObj = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    return _allObj;
}


#pragma mark --- 点击事件


-(void)clickColorBtn:(UIButton *)sender
{
    self.colorView.hidden = !self.colorView.hidden;
}
- (void)callCemera:(id)sender
{
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
        //判断如果摄像机不能用图片来源与图片库
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController *picker=[[UIImagePickerController alloc] init];
    picker.delegate=self;
    //前后摄像机
    //picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}
-(void)clickRootBtn:(UIButton *)button
{
    step = 1;
    NSLog(@"%ld",(long)button.tag);
    animal = (int)button.tag-100;
    self.nextBtn.hidden = NO;
//    self.lastBtn.hidden = NO;
    NSString *name = self.allObj.allKeys[button.tag-100];
    NSLog(@"name11 == %@",name);
    self.stepImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d.jpg",name,step]];

}
-(void)clickNextBtn:(UIButton *)sender
{
    self.lastBtn.hidden = NO;
    NSLog(@"点了");
    step++;
    NSString *name = self.allObj.allKeys[animal];
    NSArray *arr = self.allObj[name];
    if (step<arr.count+1)
    {
        self.stepImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d.jpg",name,step]];
    }
    else
    {
        step--;
        self.nextBtn.hidden = YES;
        
        NSLog(@"没有了");
    }
}
-(void)clickLastBtn:(UIButton *)sender
{
    self.nextBtn.hidden = NO;
    NSString *name = self.allObj.allKeys[animal];
    step--;
    if (step>0)
    {
        self.stepImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d.jpg",name,step]];
    }
    else
    {
        step++;
        self.lastBtn.hidden = YES;
        NSLog(@"到头了");
    }
}
- (IBAction)clickBackBtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -- 重写init
-(id)init
{
    self = [super initWithNibName:@"LMKMainViewController" bundle:nil];
    isSelectedColor = NO;
    return self;
}

#pragma mark -- colorPicker代理方法
-(void)aColorPickerIsSelected:(UIColor *)color
{
    [self.drawView setDrawColor:color];
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
