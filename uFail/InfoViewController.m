//
//  InfoViewController.m
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/21/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//

#import "InfoViewController.h"
#import "ViewController.h"
#import <MessageUI/MessageUI.h>
/**
#import "smokeScene.h"
#import "snowScene.h"
 **/
#import <SafariServices/SafariServices.h>
#import "uFail-Swift.h"


@interface InfoViewController () <SFSafariViewControllerDelegate>

@end

@implementation InfoViewController
@synthesize webViewer;
@synthesize image;
@synthesize Background;
@synthesize buttonImage;
@synthesize supportView;
@synthesize currentRunningLabel;
@synthesize theme;
@synthesize particleBackground;
@synthesize currentInfo;
@synthesize newsLabel;
UIImage *stored;
UIImage *storedButton;
AppHandler *info;
BOOL Internet;
NSUserDefaults *defaults;

- (IBAction)pushweb:(id)sender
{

    NSURL *URL = [NSURL URLWithString:@"https://uappsios.com/ufail-support/"];
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:URL];
    svc.delegate = self;
    [self presentViewController:svc animated:YES completion:nil];
    /**
    [self checkForNetwork];
    
    if(Internet == YES){
    
        
            WebViewController *webview = [self.storyboard instantiateViewControllerWithIdentifier:@"WebView"];
            webview.image = stored;
            webview.buttonImage = storedButton;
            webview.theme = theme;
            [self presentViewController:webview animated:YES completion:nil];
     
            
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"uSurfOpen://"]];
             
        
    }
        else{
        
        UIAlertView *connectionAlert = [[UIAlertView alloc]initWithTitle:@"You Are Not Connected To The Internet" message:@"Please Check Your Internet Connection and Try Again" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [connectionAlert show];

    }
     **/

}
// MARK: - Safari Delegate
- (IBAction)pushhome:(id)sender {
    if(@available(iOS 13, *)){
        [self dismissViewControllerAnimated:true completion:^{
            NSLog(@"Dismissed view controller on iOS 13...");
        }];
    } else {
        [self performSegueWithIdentifier:@"goHome" sender:nil];
    }
}

-(IBAction)CloseWeb:(id)sender {
    
    [webViewer setHidden:YES];
}
-(IBAction)changeTheme:(id)sender
{
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    if(darkTheme.on)//White theme
    {
        theme = YES;
        [defaults setBool:theme forKey:@"theme"];
        [defaults synchronize];
    }
    else //Black Theme
    {
        theme = false;
        [defaults setBool:theme forKey:@"theme"];
        [defaults synchronize];
    }
    
    ViewController *view = [[ViewController alloc]init];
    [view loadTheme];
    
}


- (BOOL)shouldAutorotate 
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (IBAction)uSurf:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/usurf-split-screen-web-browser/id953898887?ls=1&mt=8"]]];
    
}

- (IBAction)uTime:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/utime/id1125889944?ls=1&mt=8"]]];
}

- (IBAction)ufailPrivacy:(id)sender {
    NSURL *URL = [NSURL URLWithString:@"https://uappsios.com/ufail-privacy-policy/"];
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:URL];
    svc.delegate = self;
    [self presentViewController:svc animated:YES completion:nil];
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)storeDidChange:(NSNotification *)notification{
    NSLog(@"The data changed from somewhere else...");
    long failnumber = [[NSUbiquitousKeyValueStore defaultStore]longLongForKey:@"failAmount"];
    [_failCountLabel setText:[NSString stringWithFormat:@"Fail Count: %ld",failnumber]];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    info = [[AppHandler alloc]init];
    [appStoreVersionLabel setText:[info getuFailNewestVersion]];
    [currentRunningLabel setText:[info getAppVersion]];
    [newsLabel setText:[info getuAppsnews]];
    newsLabel.adjustsFontSizeToFitWidth = YES;
    // Do any additional setup after loading the view.
    /**
    SnowScene *scene = [SnowScene sceneWithSize:self.view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    particleBackground.backgroundColor = [SKColor redColor];
    particleBackground.allowsTransparency = YES;
    //_particleView.showsFPS = YES;
    [particleBackground presentScene:scene];
    smokeScene *smoke = [smokeScene sceneWithSize:particleBackground.bounds.size];
    smoke.scaleMode = SKSceneScaleModeAspectFill;
    particleBackground.backgroundColor = [SKColor clearColor];
    particleBackground.allowsTransparency  = YES;
    particleBackground.showsFPS = NO;
    [particleBackground presentScene:smoke];
    particleBackground.showsNodeCount = NO;

    **/
    NSUbiquitousKeyValueStore *store = [NSUbiquitousKeyValueStore defaultStore];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(storeDidChange:)
                                                 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification
                                               object:store];

    defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    long failNumber = [[NSUbiquitousKeyValueStore defaultStore]longLongForKey:@"failAmount"];
    //NSLog(@"numer = %i",failNumber);
    [_failCountLabel setText:[NSString stringWithFormat:@"Fail Count: %ld",failNumber]];
    
    [darkTheme setHidden:YES];
    [_themeLabel setHidden:YES];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Support" style:UIBarButtonItemStylePlain target:self action:@selector(supportViewController:)];
    [anotherButton setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = anotherButton;
    [anotherButton setTintColor:[UIColor whiteColor]];
    
    
    self.navigationItem.title = @"Info";
    

    [Background setImage:image];
    stored = image;
    storedButton = buttonImage;
    [webViewer setHidden:YES];
    currentRunningLabel.textAlignment = NSTextAlignmentCenter;
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    theme = [defaults boolForKey:@"theme"];
    if(theme == YES) //Dark theme
    {
        [darkTheme setOn:YES animated:YES];
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
    }
    else{ //Light Theme
        [darkTheme setOn:NO animated:YES];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController.navigationBar
         setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        
    }
    [currentInfo setText:[info changes]];
    [self.navigationController setNavigationBarHidden:NO];
    //ADS
    self.bannerView.adUnitID = @
    "ca-app-pub-7714978111013265/9368677969";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
    
}
-(void)viewWillLayoutSubviews{
    /**if(SYSTEM_VERSION_LESS_THAN(@"9.0"))
     {
     NSLog(@"iOS 8");
     [particleBackground setHidden:YES];
     }
     else{
     //NSLog(@"iOS 9");
     SnowScene *smoke = [SnowScene sceneWithSize:particleBackground.bounds.size];
     smoke.scaleMode = SKSceneScaleModeAspectFill;
     particleBackground.backgroundColor = [SKColor clearColor];
     [smoke removeFromParent];
     particleBackground.allowsTransparency  = YES;
     particleBackground.showsFPS = NO;
     [particleBackground presentScene:smoke];
     particleBackground.showsNodeCount = NO;
     
     }
     **/
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.navigationController setNavigationBarHidden:NO];
    [currentInfo setContentOffset:CGPointZero];
}
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    NSLog(@"SAFARI CONTROLLER DISMISSED");
}
-(void)supportViewController:(id)sender
{
    NSURL *URL = [NSURL URLWithString:@"https://uappsios.com/ufail-support/"];
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:URL];
    svc.delegate = self;
    [self presentViewController:svc animated:YES completion:nil];
    /**Depricated In Order to Push SFSafariView
    
    
    UIViewController *supportView = [self.storyboard instantiateViewControllerWithIdentifier:@"supportView"];
    
    [self.navigationController pushViewController:supportView animated:YES];
     **/
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    
}
-(BOOL)prefersStatusBarHidden
{
    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        
        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
                
            case 1136:
                return YES;
                break;
            case 1334:
                return YES;
                break;
            case 2208:
                return YES;
                break;
            case 2436:
                return NO;
                break;
            default:
                return YES;
        }
    }
    else{
        return YES;
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"SEGUE");
}




@end
