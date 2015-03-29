//
//  VideoTableViewCell.m
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/25/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import "VideoTableViewCell.h"
@import AVFoundation;
#import "Util.h"

@implementation VideoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    // Subscribe to the AVPlayerItem's DidPlayToEndTime notification.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playMediaFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:_player];


    
  //  [_imgBackground setImageURL:_currentMedia.lowResolutionImageURL];
    
  // _imgBackground.image = [Util imageWithBlurredImageWithImage:_imgBackground.image withBlurRadius:6];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)playVideo:(id)sender {
    
    
    self.loader.animationImages = [NSArray arrayWithObjects:
                                         [UIImage imageNamed:@"loader00"],
                                         [UIImage imageNamed:@"loader01"],
                                   [UIImage imageNamed:@"loader02"],
                                   [UIImage imageNamed:@"loader03"],
                                   [UIImage imageNamed:@"loader04"],
                                   [UIImage imageNamed:@"loader05"],
                                   [UIImage imageNamed:@"loader06"],
                                   [UIImage imageNamed:@"loader07"],
                                   [UIImage imageNamed:@"loader08"],
                                   [UIImage imageNamed:@"loader09"],
                                   [UIImage imageNamed:@"loader10"],
                                   [UIImage imageNamed:@"loader11"],
                                   [UIImage imageNamed:@"loader12"],
                                   [UIImage imageNamed:@"loader13"],
                                   [UIImage imageNamed:@"loader14"],
                                   [UIImage imageNamed:@"loader15"],
                                   [UIImage imageNamed:@"loader16"],
                                   [UIImage imageNamed:@"loader17"],
                                   [UIImage imageNamed:@"loader18"],
                                   [UIImage imageNamed:@"loader19"],
                                   [UIImage imageNamed:@"loader20"],
                                   [UIImage imageNamed:@"loader21"],
                                   [UIImage imageNamed:@"loader22"],
                                   [UIImage imageNamed:@"loader23.gif"], nil];
    self.loader.animationDuration = 1.0f;
    self.loader.animationRepeatCount = 0;
    self.loader.alpha = 0.6f;
    [self.loader startAnimating];
    
    
    self.viewVideoContent.hidden = NO;
    self.btnPlayArrow.hidden = YES;
    
    _player = [AVPlayer playerWithURL:self.currentMedia.standardResolutionVideoURL];
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    
    [layer setPlayer:_player];
    [layer setFrame:self.viewVideoContent.layer.frame];
    [layer setPosition: CGPointMake(layer.frame.size.width/2, layer.frame.size.width/2)];
    
    [layer setVideoGravity:AVLayerVideoGravityResize];
    
    [self.viewVideoContent.layer addSublayer:layer];
    
    [_player play];
    
    
    
    
}


-(void)playMediaFinished:(NSNotification*)theNotification
{
      self.viewVideoContent.hidden = YES;
      self.btnPlayArrow.hidden = NO;
}

-(void)doneButtonClicked
{
    [_player pause];
   // self.viewVideoContent.hidden = YES;
    self.btnPlayArrow.hidden = NO;
}

@end
