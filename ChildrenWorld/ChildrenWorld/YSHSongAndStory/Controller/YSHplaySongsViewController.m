//
//  YSHplaySongsViewController.m
//  ChildrenWorld
//
//  Created by imac on 15/10/23.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import "YSHplaySongsViewController.h"

@interface YSHplaySongsViewController ()

@end

@implementation YSHplaySongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = [UIColor cyanColor];
    isPlay = YES;
    isCircle = YES;
    lrcLineNumber = 0;
    musicTableViewHidden = YES;//初始化隐藏歌曲目录
    _musicTableView.hidden = YES;
    [self initDate];
    musicArrayNumber = 0;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[musicArray[musicArrayNumber] name] ofType:@"mp3"]] error:nil];
    currentMusic = musicArray[musicArrayNumber];
    
    //初始化音量和音量进度条
    audioPlayer.volume = 0.1;
    _soundSlider.value = audioPlayer.volume;
    [_soundSlider setThumbImage:[UIImage imageNamed:@"soundSlider.png"] forState:UIControlStateNormal];
    [_soundSlider setThumbImage:[UIImage imageNamed:@"soundSlider.png"] forState:UIControlStateHighlighted];
    //    soundSlider.hidden = YES;
    
    //初始化歌词词典
    timeArray = [[NSMutableArray alloc] initWithCapacity:10];
    LRCDictionary = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    //初始化播放进度条
    [_progressSlider setThumbImage:[UIImage imageNamed:@"sliderThumb_small.png"] forState:UIControlStateNormal];
    [_progressSlider setThumbImage:[UIImage imageNamed:@"sliderThumb_small.png"] forState:UIControlStateHighlighted];
    
    [self initLRC];
    //设置监控 每秒刷新一次时间
    [NSTimer scheduledTimerWithTimeInterval:0.1f
                                     target:self
                                   selector:@selector(showTime)
                                   userInfo:nil
                                    repeats:YES];
    
}


#pragma mark 0.1秒一次更新 播放时间 播放进度条 歌词 歌曲 自动播放下一首
- (void)showTime
{
    if ((int)audioPlayer.currentTime % 60 < 10) {
        self.currentTimeLable.text = [NSString stringWithFormat:@"%d:0%d",(int)audioPlayer.currentTime / 60,(int)audioPlayer.currentTime % 60];
    }
    else
    {
        self.currentTimeLable.text = [NSString stringWithFormat:@"%d:%d",(int)audioPlayer.currentTime / 60,(int)audioPlayer.currentTime % 60];
    }
    if ((int)audioPlayer.duration % 60 <10) {
        self.totalTimeLable.text = [NSString stringWithFormat:@"%d:0%d",(int)audioPlayer.duration / 60,(int)audioPlayer.duration % 60];
    }
    else
    {
        self.totalTimeLable.text = [NSString stringWithFormat:@"%d:%d",(int)audioPlayer.duration / 60,(int)audioPlayer.duration % 60];
    }
    //更新进度条
    self.progressSlider.value = audioPlayer.currentTime / audioPlayer.duration;
    //调用歌词函数
    [self displayLyrics:audioPlayer.currentTime];
    
    //如果播放完，调用自动播放下一首
    if (self.progressSlider.value > 0.999) {
        [self autoPlay];
    }
    
    
}
#pragma mark 载入歌曲数组
- (void)initDate {
    
    YSHSong *music1 = [[YSHSong alloc] initWithName:@"梁静茹-偶阵雨" andType:@"mp3"];
    YSHSong *music2 = [[YSHSong alloc] initWithName:@"林俊杰-背对背拥抱" andType:@"mp3"];
    YSHSong *music3 = [[YSHSong alloc] initWithName:@"情非得已" andType:@"mp3"];
    YSHSong *music4 = [[YSHSong alloc]initWithName:@"李白" andType:@"mp3"];
    
    musicArray = [[NSMutableArray alloc]initWithCapacity:5];
    [musicArray addObject:music1];
    [musicArray addObject:music2];
    [musicArray addObject:music3];
    [musicArray addObject:music4];
}
#pragma mark 得到歌词
- (void)initLRC {
    NSString *LRCPath = [[NSBundle mainBundle] pathForResource:[musicArray[musicArrayNumber] name] ofType:@"lrc"];
    NSString *contentStr = [NSString stringWithContentsOfFile:LRCPath encoding:NSUTF8StringEncoding error:nil];
    //    NSLog(@"contentStr = %@",contentStr);
    NSArray *array = [contentStr componentsSeparatedByString:@"\n"];
    for (int i = 0; i < [array count]; i++) {
        NSString *linStr = [array objectAtIndex:i];
        NSArray *lineArray = [linStr componentsSeparatedByString:@"]"];
        if ([lineArray[0] length] > 8) {
            NSString *str1 = [linStr substringWithRange:NSMakeRange(3, 1)];
            NSString *str2 = [linStr substringWithRange:NSMakeRange(6, 1)];
            if ([str1 isEqualToString:@":"] && [str2 isEqualToString:@"."]) {
                NSString *lrcStr = [lineArray objectAtIndex:1];
                NSString *timeStr = [[lineArray objectAtIndex:0] substringWithRange:NSMakeRange(1, 5)];//分割区间求歌词时间
                //                NSLog(@"%@====%@",lrcStr,timeStr);
                //把时间 和 歌词 加入词典
                [LRCDictionary setObject:lrcStr forKey:timeStr];
                [timeArray addObject:timeStr];//timeArray的count就是行数
            }
        }
    }
}

- (void)displayLyrics:(NSUInteger)time
{
    for (int i = 0; i < timeArray.count; i++) {
        NSArray *array = [timeArray[i]componentsSeparatedByString:@":"];
        //把时间转换成秒
        NSUInteger currentTime = [array[0] intValue]*60 + [array[1] intValue];
        if (i == [timeArray count]-1) {
            //求最后一句歌词的时间点
            NSArray *array1 = [timeArray[timeArray.count-1] componentsSeparatedByString:@":"];
            NSUInteger currentTime1 = [array1[0] intValue] * 60 + [array1[1] intValue];
            if (time > currentTime1) {
                [self updateLrcTableView:i];
                break;
            }
        }
        else
        {
            //求出第一句的时间点，在第一句显示前的时间内一直加载第一句
            NSArray *array2 = [timeArray[0] componentsSeparatedByString:@":"];
            NSUInteger currentTime2 = [array2[0] intValue] * 60 + [array2[1] intValue];
            if (time < currentTime2)
            {
                [self updateLrcTableView:0];
                //                NSLog(@"马上到第一句");
                break;
            }
            //求出下一步的歌词时间点，然后计算区间
            NSArray *array3 = [timeArray[i+1] componentsSeparatedByString:@":"];
            NSUInteger currentTime3 = [array3[0] intValue] * 60 + [array3[1] intValue];
            if (time >= currentTime && time <= currentTime3) {
                [self updateLrcTableView:i];
                break;
            }
            
        }
        
    }
}
#pragma mark 动态更新歌词表歌词
- (void)updateLrcTableView:(NSUInteger)lineNumber
{
    //重新载入歌词列表
    lrcLineNumber = lineNumber;
    [self.lrcTableView reloadData];
    
    //使被选中的行移到中间
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:lineNumber inSection:0];
    [self.lrcTableView selectRowAtIndexPath:indexpath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}


//更新播放器设置
- (void)updatePlayerSetting
{
    //更新播放按钮状态
    [self.playBtn setBackgroundImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    isPlay = NO;
    
    //更新曲目
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[musicArray[musicArrayNumber] name] ofType:@"mp3"]] error:nil];
    currentMusic = musicArray[musicArrayNumber];
    //更新音量
    audioPlayer.volume = self.soundSlider.value;
    //重新载入歌词词典
    timeArray = [[NSMutableArray alloc] initWithCapacity:10];
    LRCDictionary = [[NSMutableDictionary alloc] initWithCapacity:10];
    [self initLRC];
    
    [audioPlayer play];
    
}


//自动播放下一首
- (void)autoPlay
{
    //判断是否允许循环播放
    if (isCircle == YES) {
        if (musicArrayNumber == musicArray.count - 1) {
            musicArrayNumber = -1;
        }
        musicArrayNumber ++;
        
        [self updatePlayerSetting];
    } else {
        [audioPlayer play];
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        isPlay = NO;
    }
    
}


#pragma mark - tableView视图

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return musicArray.count;
    }
    else
    {
        return timeArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LRCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //该表格选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == lrcLineNumber) {
        cell.textLabel.text = LRCDictionary[timeArray[indexPath.row]];
        cell.textLabel.font = [UIFont systemFontOfSize:25];
//        cell.textLabel.font = [UIFont fontWithName:@"STKaiti" size:25];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:25];
        cell.textLabel.textColor = [UIColor orangeColor];
//        cell.textLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
//        cell.textLabel.font = [UIFont systemFontOfSize:15];
    } else {
        cell.textLabel.text = LRCDictionary[timeArray[indexPath.row]];
        cell.textLabel.font = [UIFont systemFontOfSize:20];
        cell.textLabel.textColor = [UIColor redColor];

//        cell.textLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//        cell.textLabel.font = [UIFont systemFontOfSize:13];
    }
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35;
}

- (void)playTable:(NSUInteger)tableNumber
{
    musicArrayNumber = tableNumber;
    [self updatePlayerSetting];
}


- (void)didReceiveMemoryWarning
{
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
//上一首
- (IBAction)aboveMusic:(id)sender {
    if (musicArrayNumber == 0) {
        musicArrayNumber = musicArray.count;
    }
    musicArrayNumber --;
    
    [self updatePlayerSetting];
}
//下一首
- (IBAction)nextMusic:(id)sender
{
    if (musicArrayNumber == musicArray.count - 1) {
        musicArrayNumber = -1;
    }
    musicArrayNumber ++;
    
    [self updatePlayerSetting];
}
//播放
- (IBAction)play:(id)sender
{
    if (isPlay) {
        [audioPlayer play];
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        isPlay = NO;
    } else {
        [audioPlayer pause];
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        isPlay = YES;
    }
    audioPlayer.volume = self.soundSlider.value;//重置音量,(每次播放的默认音量好像是1.0)

}
- (IBAction)progressChanged:(id)sender
{
    audioPlayer.currentTime = self.progressSlider.value * audioPlayer.duration;
}
- (IBAction)soundChange:(id)sender
{
    audioPlayer.volume = self.soundSlider.value;

}
- (IBAction)circle:(id)sender
{
    if (isCircle) {
        self.circleBtn.alpha = 0.5;
        isCircle = NO;
    } else {
        self.circleBtn.alpha = 1.0;
        isCircle = YES;
    }

}
@end
