//
//  DetailViewController.m
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/23/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AVFoundation/AVFoundation.h"

@interface DetailViewController () {

    AVPlayer *player;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Subscribe to the AVPlayerItem's DidPlayToEndTime notification.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playMediaFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:player];


   // self.videoView.hidden = YES;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoHeader"]];
   // [self.postImage setImageURL:self.media.standardResolutionImageURL];
   //  [self.postImageBackground setImageURL:self.media.standardResolutionImageURL];
   // self.lblDescription.text = self.media.caption.text;
    
    
   // self.postImageBackground.image = [self imageWithBlurredImageWithImage:self.postImageBackground.image andBlurInsetFromBottom: self.postImageBackground.image.size.height withBlurRadius:5] ;
}

    


- (UIImage*)imageWithBlurredImageWithImage:(UIImage*)image andBlurInsetFromBottom:(CGFloat)bottom withBlurRadius:(CGFloat)blurRadius{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -image.size.height);
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, bottom), [self blurImage: image withBottomInset: bottom blurRadius: blurRadius].CGImage);
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage*)blurImage:(UIImage*)image withBottomInset:(CGFloat)inset blurRadius:(CGFloat)radius{
    
    image =  [UIImage imageWithCGImage: CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, image.size.height - inset, image.size.width,inset))];
    
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@(radius) forKey:kCIInputRadiusKey];
    
    CIImage *outputCIImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    
    return [UIImage imageWithCGImage: [context createCGImage:outputCIImage fromRect:ciImage.extent]];
    
}

/*
- (IBAction)playVideo:(id)sender {
    
    self.videoView.hidden = NO;
    self.btnPlayArrow.hidden = YES;
 
    player = [AVPlayer playerWithURL:self.media.lowResolutionVideoURL];
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    
    [layer setPlayer:player];
    [layer setFrame:self.videoView.layer.frame];
    [layer setPosition: CGPointMake(layer.frame.size.width/2, layer.frame.size.width/2)];
    
    [layer setVideoGravity:AVLayerVideoGravityResize];
    
    [self.videoView.layer addSublayer:layer];
    
    [player play];
    
    
    
    
}
 */

-(void)playMediaFinished:(NSNotification*)theNotification
{
  //  self.videoView.hidden = YES;
  //  self.btnPlayArrow.hidden = NO;
}

-(void)doneButtonClicked
{
}



- (void)didReceiveMemoryWarning {
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

@end
