//
//  HomeTableViewCell.h
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/23/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"


@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblLikes;
@property (weak, nonatomic) IBOutlet UILabel *lblComments;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;


@end
