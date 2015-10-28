//
//  YSHplaySongsViewController.h
//  ChildrenWorld
//
//  Created by imac on 15/10/23.
//  Copyright (c) 2015年 Clown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "YSHSong.h"
@interface YSHplaySongsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    AVAudioPlayer *audioPlayer;
    NSMutableArray *musicArray;
    BOOL isPlay;
    BOOL isCircle;
    BOOL musicTableViewHidden;
    float tempVolume;
    YSHSong *currentMusic;
    NSMutableArray *timeArray;
    NSMutableDictionary *LRCDictionary;
    NSUInteger lrcLineNumber;
    NSUInteger musicArrayNumber;
}
@property (nonatomic, strong) NSMutableArray *musicArray;

@property (weak, nonatomic) IBOutlet UIButton *abloveMusic;
- (IBAction)aboveMusic:(id)sender;
- (IBAction)nextMusic:(id)sender;
- (IBAction)play:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
- (IBAction)progressChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
- (IBAction)soundChange:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *circleBtn;
- (IBAction)circle:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLable;
@property (weak, nonatomic) IBOutlet UITableView *lrcTableView;
@property (weak, nonatomic) IBOutlet UITableView *musicTableView;


- (void)playTable:(NSUInteger)tableNumber;

@end
