//
//  DetailViewController.h
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/23/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramMedia.h"
#import "InstagramKit.h"
#import "AsyncImageView.h"

@interface DetailViewController : UITableViewController

    @property (strong, nonatomic) InstagramMedia *media;


/*
    @property (weak, nonatomic) IBOutlet AsyncImageView *postImage;
    @property (weak, nonatomic) IBOutlet UIView *videoView;
    @property (weak, nonatomic) IBOutlet UIButton *btnPlayArrow;
*/

@end
