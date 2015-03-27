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
    
    self.viewVideoContent.hidden = NO;
    self.btnPlayArrow.hidden = YES;
    
    _player = [AVPlayer playerWithURL:self.currentMedia.lowResolutionVideoURL];
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
