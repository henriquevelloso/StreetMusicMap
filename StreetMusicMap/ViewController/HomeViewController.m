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
#import "DetailViewController.h"

@interface HomeViewController ()
{
    InstagramMedia *currentMedia;
    NSMutableArray *postArray;
    

}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoHeader"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark Custom Methods

-(void) loadData {
    InstagramEngine *sharedEngine = [[InstagramEngine alloc] init];// [InstagramEngine sharedEngine];
    
    
    NSString *userID = @"1028760904";
    
        
        
        
         [[InstagramEngine sharedEngine] getMediaForUser:userID count:40 maxId:self.paginationInfo.nextMaxId withSuccess:^(NSArray *media, InstagramPaginationInfo *paginationInfo) {
             
             postArray = [[NSMutableArray alloc] initWithArray:media];
             [self.tableView reloadData];
             
             
         } failure:^(NSError *error) {
             
             
         }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return postArray.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
     HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellPost" forIndexPath:indexPath];
 
     if (postArray.count >= indexPath.row+1) {
         InstagramMedia *mediaOld = postArray[indexPath.row];
         
         cell.delegate = self;
         cell.tag = indexPath.section;
         
         [cell.imgPhoto setImageURL:mediaOld.standardResolutionImageURL];
           cell.lblLocation.text = mediaOld.locationName;

         
         NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
         [formatter setDateFormat:@"dd MMM yyyy"];
         cell.lblDate.text = [formatter stringFromDate:mediaOld.createdDate];
         
         cell.lblLikes.text = @(mediaOld.likesCount).stringValue;
         cell.lblComments.text = @(mediaOld.commentCount).stringValue;
         
         cell.media = mediaOld;
      
         
         /*
            [[InstagramEngine sharedEngine] getLocationName:mediaOld.location count:1 maxId:nil withSuccess:^(NSArray *media, InstagramPaginationInfo *paginationInfo) {
                
                mediaOld.locationName = media[indexPath.row];
                
            } failure:^(NSError *error) {
         
                
            }];
  */
         
     }
     else
         [cell.imageView setImage:nil];
     return cell;
 return cell;
 }
 

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     
     if ([segue.identifier isEqualToString:@"segueDetail"])
     {
         DetailViewController *detailViewController = segue.destinationViewController;
         detailViewController.media = currentMedia;
        
     }

 }

#pragma mark - Methods of HomeTableViewCell (Delegate)


- (void)homeTableViewCell:(HomeTableViewCell *)controller media:(InstagramMedia *)media {
    
    currentMedia = media;
    [self performSegueWithIdentifier:@"segueDetail" sender:nil];

}


/*
- (void)homeTableViewCell:(HomeTableViewCell *)controller liked:(BOOL)liked {
    dicLikes = controller.dicLikes;
    dicLikesFromCurrentProfile = controller.dicLikesFromCurrentProfile;
    
    [self updateSectionHeaderForSection:controller.tag];
}

- (void)homeTableViewCell:(HomeTableViewCell *)controller commentsPhotoId:(NSString *)commentsPhotoId photoUserId:(NSString *)photoUserId {
    commentsPhotoObjectId = commentsPhotoId;
    commentsPhotoUserObjectId = photoUserId;
    
    [self performSegueWithIdentifier:@"segueComments" sender:nil];
}
*/

@end
