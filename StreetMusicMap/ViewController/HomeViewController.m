//
//  HomeViewController.m
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/23/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "InstagramMedia.h"
#import "DetailTableViewController.h"
#import "Util.h"

@interface HomeViewController ()
{
    NSMutableArray *postArray;
    

}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.view.backgroundColor =
    [UIColor colorWithPatternImage: [UIImage imageNamed:@"Default"]];
    self.tableView.backgroundColor = [UIColor clearColor];
        
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(-16, 0, 0, -10);
    
    [self loadData];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoHeader"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark Custom Methods




-(void) loadData {
    
    NSString *userID = @"1028760904";
    
    InstagramEngine *sharedEngine = [[InstagramEngine alloc] init];
    
    if (!postArray) {
        postArray = [[NSMutableArray alloc] init];
    }
    
    
    [sharedEngine getMediaForUser:userID
                            count:30
                            maxId:self.currentPaginationInfo.nextMaxId
                      withSuccess:^(NSArray *media, InstagramPaginationInfo *paginationInfo)
    {
    
        if (paginationInfo) {
            self.currentPaginationInfo = paginationInfo;
        }
        for (InstagramMedia *item in media) {
            
            if (![postArray containsObject:item]) {
                [postArray addObject:item];
            }
            
        }
        
        
        [self.tableView reloadData];

    } failure:^(NSError *error) {
             
             
    }];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return postArray.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
     HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellPost" forIndexPath:indexPath];
 
     if (postArray.count >= indexPath.row+1) {
         InstagramMedia *mediaOld = postArray[indexPath.row];
         
         
         
         cell.delegate = self;
         cell.tag = indexPath.section;
         
        // [cell.imgPhoto setImageURL:mediaOld.standardResolutionImageURL];
         cell.lblLocation.text = mediaOld.locationName;

         [cell.imgPhoto setImageWithURL:mediaOld.standardResolutionImageURL placeholderImage:[UIImage imageNamed:@"placeholder"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
         
         
         NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
         [formatter setDateFormat:@"dd MMM yyyy"];
         cell.lblDate.text = [formatter stringFromDate:mediaOld.createdDate];
         
         cell.lblLikes.text = @(mediaOld.likesCount).stringValue;
         cell.lblComments.text = @(mediaOld.commentCount).stringValue;
         
         cell.media = mediaOld;
      
         


     }
     else
         [cell.imageView setImage:nil];
     return cell;
 return cell;
 }
 





-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.currentPaginationInfo) {
        if ([indexPath isEqual:[NSIndexPath indexPathForRow:[self tableView:self.tableView numberOfRowsInSection:0]-15 inSection:0]]) {
            
            NSLog(@"reload");
            [self loadData];
        }
    }
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     
     if ([segue.identifier isEqualToString:@"segueDetail"])
     {
         DetailTableViewController *detailViewController = segue.destinationViewController;
         detailViewController.currentMedia = _currentMedia;
        
     }

 }

#pragma mark - Methods of HomeTableViewCell (Delegate)


- (void)homeTableViewCell:(HomeTableViewCell *)controller media:(InstagramMedia *)media {
    
    _currentMedia = media;
    [self performSegueWithIdentifier:@"segueDetail" sender:nil];

}


@end
