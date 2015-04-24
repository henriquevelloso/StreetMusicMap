//
//  MapViewController.m
//  StreetMusicMap
//
//  Created by Henrique Velloso on 3/23/15.
//  Copyright (c) 2015 TrueTapp. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()



@end

static BOOL allowLoad;

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    allowLoad = YES;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LogoHeader"]];
    
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.webView.scrollView.bounces = NO;
    self.webView.scrollView.scrollEnabled = NO;
    [self.webView setDataDetectorTypes:UIDataDetectorTypeNone];
    self.webView.contentMode = UIViewContentModeScaleAspectFit;
    self.webView.delegate = self;
    

    NSURL *url = [NSURL URLWithString:@"https://www.google.com/maps/d/u/0/viewer?mid=z9Jdu3P1GTXQ.kVWJEkhIKftc"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}



- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activeIndicator startAnimating];
    self.activeIndicator.hidesWhenStopped = YES;
    allowLoad = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activeIndicator stopAnimating];
    allowLoad = NO;
    
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    return allowLoad;
}

@end
