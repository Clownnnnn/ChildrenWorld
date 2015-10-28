//
//  YSHSingSongViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/22.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "YSHSingSongViewController.h"
#import "YSHplaySongsViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface YSHSingSongViewController ()<UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer ;
}
@property (nonatomic,strong)NSArray *arr;

@end

@implementation YSHSingSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.backImageView];
    [self.backImageView addSubview:self.songTableView];
}

-(NSArray *)arr
{
    if (!_arr) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"YSHSongs" ofType:@"plist"];
        _arr = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _arr;
}
-(UITableView *)songTableView
{
    if (!_songTableView) {
        _songTableView = [[UITableView alloc]initWithFrame:CGRectMake(45, 260, 280, 291) style:UITableViewStylePlain];
        _songTableView.delegate = self;
        _songTableView.dataSource = self;
        _songTableView.backgroundColor = [UIColor clearColor];
//        _songTableView.backgroundColor = [UIColor colorWithRed:252 green:247 blue:226 alpha:1];
        
        
    }
    return _songTableView;
}
-(UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 668)];
        UIImage *image = [UIImage imageNamed:@"听儿歌_meitu_1.jpg"];
        self.backImageView.userInteractionEnabled = YES;
        self.backImageView.image = image;
    }
    return _backImageView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellWithIdentifier = @"cellWithIDentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellWithIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
//    cell.backgroundColor = [UIColor colorWithRed:252 green:247 blue:226 alpha:0.2];
    cell.textLabel.text = self.arr[indexPath.row];
    cell.textLabel.textColor = [UIColor orangeColor];
//    cell.textLabel.font = [UIFont systemFontOfSize:24];
    cell.textLabel.font = [UIFont fontWithName:@"Baskerville-Bold" size:25];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"====%ld",(long)indexPath.row);
//    NSURL *url = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle] pathForResource:self.arr[indexPath.row] ofType:@"mp3"]];
//    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
//    audioPlayer.delegate = self;
//    [audioPlayer play];
    
    YSHplaySongsViewController *playSongs_VC = [[YSHplaySongsViewController alloc]initWithNibName:@"YSHplaySongsViewController" bundle:nil];
    [self presentViewController:playSongs_VC animated:YES completion:^{
        
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
