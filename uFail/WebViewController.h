//
//  WebViewController.h
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/21/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
{
    IBOutlet UIWebView *webView;
    IBOutlet UINavigationBar *supportViewer;
    IBOutlet UIToolbar *toolBar;
}
@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property(nonatomic)UIImage *image;
@property(nonatomic)UIImage *buttonImage;
@property(nonatomic)BOOL theme;
-(IBAction)action:(id)sender;
- (IBAction)homepush:(id)sender;
- (IBAction)InfoPush:(id)sender;

@end
