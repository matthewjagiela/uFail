//
//  InfoViewController.h
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/21/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SpriteKit;
@import SafariServices;
@import GoogleMobileAds;

@interface InfoViewController : UIViewController

{
    IBOutlet UILabel *appStoreVersionLabel;
    IBOutlet UILabel *wtf;
    IBOutlet UISwitch *darkTheme;

}

@property (strong, nonatomic) IBOutlet GADBannerView *bannerView;

//@property (weak, nonatomic) IBOutlet SKView *particleView;
@property(nonatomic) IBOutlet UIWebView *supportView;
@property(nonatomic)UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *Background;
@property(nonatomic)UIImage *buttonImage;
@property(nonatomic)IBOutlet UIView *webViewer;
@property (strong, nonatomic) IBOutlet UILabel *currentRunningLabel;
@property(nonatomic)BOOL theme;
@property (weak, nonatomic) IBOutlet UILabel *newsLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property(nonatomic, weak) id< SFSafariViewControllerDelegate > delegate;
@property (weak, nonatomic) IBOutlet SKView *particleBackground;
@property (weak, nonatomic) IBOutlet UILabel *failCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *currentInfo;



-(IBAction)facebook:(id)sender;
- (IBAction)pushweb:(id)sender;
- (IBAction)pushhome:(id)sender;
- (IBAction)CloseWeb:(id)sender;
- (IBAction)uSurf:(id)sender;
- (IBAction)uTime:(id)sender;
- (IBAction)ufailPrivacy:(id)sender;


@end
