//
//  WebViewController.m
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/21/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//

#import "WebViewController.h"
#import "ViewController.h"
#import "InfoViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView;
@synthesize image;
@synthesize buttonImage;
@synthesize theme;
UIImage *helloworld;

- (IBAction)homepush:(id)sender {
    
    ViewController *home = [self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    home.buttonImage = buttonImage;
    home.bgImage = image;
    //home.darkTheme = theme;
    [self presentViewController:home animated:YES completion:nil];
}

- (IBAction)InfoPush:(id)sender {
    
    InfoViewController *ifvc = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    ifvc.image = helloworld;
    ifvc.buttonImage = buttonImage;
    [self presentViewController:ifvc animated:YES completion:nil];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *currentURL = webView.request.URL.absoluteString;
        NSLog(currentURL);
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:currentURL]]];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)goHome:(id)sender
{
    UIViewController *homeView = [self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    
    [self.navigationController pushViewController:homeView animated:YES];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *fullUrl = @"http://apples-genius.com/ufail-support";
    NSURL *url = [NSURL URLWithString:fullUrl];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(goHome:)];
    self.navigationItem.rightBarButtonItem = homeButton;
    self.navigationItem.title = @"Support";

    
    
    self.view.backgroundColor = [UIColor blackColor];
    helloworld =image;
    if (!theme)
    {
        NSLog(@"Dark Theme");
        [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
        [[UINavigationBar appearance]setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
        [[UIBarButtonItem appearance]setTintColor:[UIColor whiteColor]];
        [[UIToolbar appearance] setBarTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
        
    }
    else
    {
        NSLog(@"Light Theme");
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance]setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor blackColor]}];
        [[UIBarButtonItem appearance]setTintColor:[UIColor blackColor]];
        self.view.backgroundColor = [UIColor whiteColor];
        [[UIToolbar appearance]setBarTintColor:[UIColor whiteColor]];
        //[[UINavigationBar appearance] setTranslucent:YES];
        
    }
    //[[UINavigationBar appearance]setTranslucent:NO ];
    
    
}
-(void)webViewDidFinishLoad:(UIWebView *)singleWebView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
-(void)webViewDidStartLoad:(UIWebView *)singleWebView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(BOOL)prefersStatusBarHidden
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return NO;
    }
    else{
        return NO;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
