//
//  VideoTableViewCell.h
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/25/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface VideoTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet AsyncImageView *imgPostImage;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayArrow;
@property (weak, nonatomic) IBOutlet UIView *viewVideoContent;

@property (weak, nonatomic) IBOutlet UILabel *lblLocation;

@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@end