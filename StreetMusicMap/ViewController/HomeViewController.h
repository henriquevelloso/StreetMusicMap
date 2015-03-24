//
//  HomeViewController.h
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/23/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramKit.h"
#import "HomeTableViewCell.h"

@interface HomeViewController : UITableViewController <HomeTableViewCellDelegate>

@property (strong, nonatomic) InstagramPaginationInfo *paginationInfo;

@end
