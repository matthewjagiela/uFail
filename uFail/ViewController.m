//
//  ViewController.m
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/11/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//
#import "uFail-Swift.h"
#import "ViewController.h"
#import "InfoViewController.h"
#import "SnowScene.h"
#define myAppDelegate (MyAppDelegate *)[[UIApplication sharedApplication] delegate]
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define iPhoneVersion ([[UIScreen mainScreen] bounds].size.height == 568 ? 5 : ([[UIScreen mainScreen] bounds].size.height == 480 ? 4 : ([[UIScreen mainScreen] bounds].size.height == 667 ? 6 : ([[UIScreen mainScreen] bounds].size.height == 736 ? 61 : 999))))
#define iPadVersion ([[UIScreen mainScreen] bounds].size.height == 1366 ? 1 : 999)
/**
#import "SnowScene.h"
#import "smokeScene.h"
 **/
@interface UIViewController ()

@end

@implementation ViewController
@synthesize backgroundImage;
@synthesize FailButton;
@synthesize bgImage;
@synthesize buttonImage;
@synthesize screenBackgroundImage;
@synthesize messageView;
@synthesize colorView;
@synthesize TestCountdown;
@synthesize theme;
@synthesize UpdateButton;
@synthesize particleBackground;
int soundSelected = 1;
int themeSelected = 0;
UIImage *failimage;

bool iPhone6;
bool messageActive;


int mainInt = 5;
/**-(IBAction)testTimer:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}
 **/
-(void)loadTheme
{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    theme = [defaults boolForKey:@"theme"];
    if(theme)//White
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance]setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor blackColor]}];
        [[UIBarButtonItem appearance]setTintColor:[UIColor blackColor]];
        self.view.backgroundColor = [UIColor whiteColor];
        [[UIToolbar appearance]setBarTintColor:[UIColor whiteColor]];
       // [[UINavigationBar appearance] setTranslucent:YES];
    }
    else //black
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
        [[UINavigationBar appearance]setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
        [[UIBarButtonItem appearance]setTintColor:[UIColor whiteColor]];
        [[UIToolbar appearance] setBarTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
    }
}
-(void)themeManagement{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    if([defaults objectForKey:@"themeColor"] == nil){
        [defaults setObject:@"winter" forKey:@"themeColor"];
    }
    if([[defaults objectForKey:@"themeColor"] isEqualToString:@"winter"]) //Winter / Summer theme
    {
        NSLog(@"Theme selected == 0");
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
            if(iPhoneVersion==4) //Something to do with the iPhone 4 (Not supported anymore... do not worry about...)
            {
                bgImage = [UIImage imageNamed:@"iPhone 4-5.png"];
            }
            else if (iPhoneVersion ==5) //iPhone 5 style of phone (Including SE). Still need to do something about
            {
                bgImage = [UIImage imageNamed:@"iPhone 5 summer.png"];
                
            }
            else if (iPhoneVersion==6) //iPhone 6 family
            {
                bgImage = [UIImage imageNamed:@"iPhone 6 Summer.png"];
                
            }
            else if (iPhoneVersion==61) //iPhone 6+ Family
            {
                bgImage = [UIImage imageNamed:@"iPhone 6+ Summer.png"];
                
            }
            else{ //iPhone X family.
                bgImage = [UIImage imageNamed:@"iPhone 6 Summer.png"];
            }
            
        }
        else{ //iPad Family. (Winter)
            bgImage = [UIImage imageNamed:@"iPad Image Warm.png"];
            ViewController *vc = [[UIViewController alloc]init];
            UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vc];
            
            [self.navigationController setNavigationBarHidden:YES];
        }
        failimage = [UIImage imageNamed:@"uFail Button 8.png"];
    }
    else if([[defaults objectForKey:@"themeColor"]isEqualToString:@"blue"]){
        bgImage = [UIImage imageNamed:@"blue theme.png"];
        failimage = [UIImage imageNamed:@"Actual Blue Button.png"];
    }
    else if([[defaults objectForKey:@"themeColor"]isEqualToString:@"green"]){
        bgImage = [UIImage imageNamed:@"greenBackGround.png"];
        failimage = [UIImage imageNamed:@"Green Button.png"];
        
    }
    else if([[defaults objectForKey:@"themeColor"]isEqualToString:@"purple"]){
        bgImage = [UIImage imageNamed:@"Purple Background.png"];
        failimage = [UIImage imageNamed:@"Purple Button.png"];
    }
    else if([[defaults objectForKey:@"themeColor"]isEqualToString:@"red"]){
        bgImage = [UIImage imageNamed:@"Background Image Universal.png"];
        failimage = [UIImage imageNamed:@"Fail Button.png"];
    }
    [backgroundImage setImage:bgImage];
    [FailButton setImage:failimage forState:UIControlStateNormal];
}
- (void)viewDidLoad

{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self checkTheme];
    [self loadTheme];
    [messageView setHidden:YES];
    [colorView setHidden:YES];
    [_blurEffect setHidden:YES];
    //_blurEffect.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height + messageView.frame.size.height));
    NSLog(@"Height: %f",[[UIScreen mainScreen] bounds].size.height);
    if(iPadVersion == 1)
    {
        NSLog(@"iPad Pro");
    }
    
    
    
    
    if (iPhoneVersion==4) {
        NSLog(@"This is 3.5 inch iPhone - iPhone 4s or below");
        //[FailButton setImage:failimage forState:nil];
    } else if (iPhoneVersion==5) {
        NSLog(@"This is 4 inch iPhone - iPhone 5 family");
    } else if (iPhoneVersion==6) {
        NSLog(@"This is 4.7 inch iPhone - iPhone 6");
        iPhone6 = true;
    } else if (iPhoneVersion==61) {
        NSLog(@"This is 5.5 inch iPhone - iPhone 6 Plus.. The BIGGER");
        iPhone6 = true;
    } else {
        NSLog(@"This is iPad");
    }
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        messageView.center =  CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height + 20));
    }
    [self themeManagement];
    
    
    SnowScene *scene = [SnowScene sceneWithSize:self.view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    particleBackground.backgroundColor = [SKColor clearColor];
    particleBackground.allowsTransparency = YES;
     
    [particleBackground presentScene:scene];
    
    [_Santa setHidden:YES];
    
     
    
    /**
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        smokeScene *smoke = [smokeScene sceneWithSize:particleBackground.bounds.size];
        smoke.scaleMode = SKSceneScaleModeAspectFill;
        particleBackground.backgroundColor = [SKColor redColor];
        particleBackground.allowsTransparency  = YES;
        particleBackground.showsFPS = NO;
        [particleBackground presentScene:smoke];
        particleBackground.showsNodeCount = NO;
    }
    else{
        smokeScene *smoke = [smokeScene sceneWithSize:particleBackground.bounds.size];
        smoke.scaleMode = SKSceneScaleModeAspectFill;
        particleBackground.backgroundColor = [SKColor clearColor];
        particleBackground.allowsTransparency  = YES;
        particleBackground.showsFPS = NO;
        [particleBackground presentScene:smoke];
        particleBackground.showsNodeCount = NO;
        ;
        [self applewatch];
        
        
    }
    **/

    
    //[particleBackground setHidden:YES];
    //particleBackground.backgroundColor = [UIColor clearColor];
    //particleBackground.backgroundColor = [UIColor clearColor];
    [_blurEffect setHidden:YES];
   // [self clearTheme];
    
    
    
    
}
-(void)clearTheme
{
    NSUserDefaults *standardDefaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    [standardDefaults setBool:false forKey:@"theme"];
    [standardDefaults synchronize];
    NSLog(@"The theme should be cleared");
    [self loadTheme];
}

-(void)supportViewController:(id)sender
{
    UIViewController *supportVC = [self.storyboard instantiateViewControllerWithIdentifier:@"supportView"];
    
    [self.navigationController pushViewController:supportVC animated:YES];
}

- (void)countDown
{
    mainInt -=1;
    TestCountdown.text = [NSString stringWithFormat:@"%i",mainInt];
}
- (BOOL)shouldAutorotate
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return YES;
    }
    else{
        return NO;
    }
}


-(IBAction)pickSound:(id)sender
{
    [colorView setHidden:YES];
   
     if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
     {
         [messageView setHidden:NO];
         [screenBackgroundImage setImage:bgImage];
         
         messageView.translatesAutoresizingMaskIntoConstraints = true;
         
         [_blurEffect setHidden:NO];
         messageView.center =  CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height + 20));
         NSLog(@"The height and width should be %f %f",self.view.frame.size.height / 2,self.view.frame.size.width / 2);
         [UIView animateWithDuration:0.5 animations:^{messageView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height / 2));
             
             _blurEffect.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height / 2));
             
             
             }];
         
         NSLog(@"The actual height and width is: %f",messageView.center.y);
         
         
         NSLog(@"The Height of Blur is %f, and the width is %f:",_blurEffect.center.x,_blurEffect.center.y);
         [_blurEffect setHidden:NO];


    }

     else if(iPhone6 == true)
     {
         [messageView setHidden:NO];
         [screenBackgroundImage setImage:bgImage];
         [_blurEffect setHidden:NO];
         _blurEffect.center = CGPointMake((self.view.frame.size.width/2),self.view.frame.size.height + messageView.frame.size.height);
         
         messageView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height + messageView.frame.size.height));
         [UIView animateWithDuration:.8 animations:^{
             self->messageView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height/2));
             self->_blurEffect.center = CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height/2));
         }];
         if(iPhoneVersion==6)
         {
             messageView.center =  CGPointMake(187.5f,668.0f);
             
             //[UIView animateWithDuration:0.5 animations:^{messageView.center = CGPointMake(187.5f, 333.5f);}];
             
             self.messageView.center = self.view.superview.center;

         }
         if(iPhoneVersion==61)
         {
             //messageView.center =  CGPointMake(207.0f,738.0f);
             
             //[UIView animateWithDuration:0.5 animations:^{messageView.center = CGPointMake(207.0f, 368.0f);}];
             self.messageView.center = self.view.superview.center;

         }

         
     }
     else{
         
         
         UIAlertController *message = [UIAlertController alertControllerWithTitle:@"Choose A Message" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
         UIAlertAction *failAction = [UIAlertAction actionWithTitle:@"Fail" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 1;
             
         }];
         UIAlertAction *eFailAction = [UIAlertAction actionWithTitle:@"Epic Fail" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 2;
         }];
         UIAlertAction *winAction = [UIAlertAction actionWithTitle:@"Win!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 3;
         }];
         UIAlertAction *pwnedAction = [UIAlertAction actionWithTitle:@"PWNED" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 4;
         }];
         UIAlertAction *failureAction = [UIAlertAction actionWithTitle:@"FAILURE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 5;
         }];
         UIAlertAction *ufailAction = [UIAlertAction actionWithTitle:@"uFail" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 6;
         }];
         UIAlertAction *friendsAction = [UIAlertAction actionWithTitle:@"So Mant Friends" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 7;
         }];
         UIAlertAction *hornAction = [UIAlertAction actionWithTitle:@"Air Horn!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             soundSelected = 8;
             failimage = [UIImage imageNamed:@"Air Horn.png"];
             //[backgroundImage setImage:bgImage];
             [FailButton setImage:[UIImage imageNamed:@"Air Horn.png"]forState:nil];
         }];
         //Add all the actions to the sheet
         [message addAction:failAction];
         [message addAction:eFailAction];
         [message addAction:winAction];
         [message addAction:pwnedAction];
         [message addAction:failureAction];
         [message addAction:ufailAction];
         [message addAction:friendsAction];
         [message addAction:hornAction];
         [self presentViewController:message animated:true completion:nil];

         
     }
    messageActive = true;
    

}


-(IBAction)pickColor:(id)sender
{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
     [messageView setHidden:YES];
    //[_Santa setHidden:YES];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {

        [colorView setHidden:NO];
        colorView.center =  CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height + 20));
        [_blurEffect setHidden:NO];
        
        //messageView.center =  CGPointMake((self.view.frame.size.width / 2),(self.view.frame.size.height +50));
        [UIView animateWithDuration:0.5 animations:^{self->colorView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height / 2));}];
        [UIView animateWithDuration:0.5 animations:^{self->_blurEffect.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height / 2));}];
            //self.colorView.center = self.
            //self.colorView.center = self.view.superview.center;
        NSLog(@"portrait");
        

    }
    else if(iPhone6 == true)
    {
        [colorView setHidden:NO];
        if(iPhoneVersion==6)
        {
            //colorView.center =  CGPointMake(187.5f,668.0f);
            
            //[UIView animateWithDuration:0.5 animations:^{colorView.center = CGPointMake(187.5f, 333.5f);}];
            [colorView setHidden:NO];
            colorView.center =  CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height + 20));
            [_blurEffect setHidden:NO];
            
            //messageView.center =  CGPointMake((self.view.frame.size.width / 2),(self.view.frame.size.height +50));
            [UIView animateWithDuration:0.5 animations:^{
                self->colorView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height / 2));
                self->_blurEffect.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height/2));
            }];

            
            self.colorView.center = self.view.superview.center;

        }
        else if(iPhoneVersion==61)
        {
            //colorView.center =  CGPointMake(207.0f,368.0f);
            
            //[UIView animateWithDuration:0.5 animations:^{colorView.center = CGPointMake(207.0f, 368.0f);}];
            self.colorView.center = self.view.superview.center;

        }

        
    }
    else
    {
        //Dynamic, blue, Red, Green, Purple
        UIAlertController *themeChooser = [UIAlertController alertControllerWithTitle:@"Choose A Theme" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *dynamicAction = [UIAlertAction actionWithTitle:@"Summer" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [defaults setObject:@"winter" forKey:@"themeColor"];
            [self themeManagement];
            
        }];
        UIAlertAction *blueAction = [UIAlertAction actionWithTitle:@"Blue" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [defaults setObject:@"blue" forKey:@"themeColor"];
            [self themeManagement];
        }];
        UIAlertAction *redAction = [UIAlertAction actionWithTitle:@"Red" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [defaults setObject:@"red" forKey:@"themeColor"];
            [self themeManagement];
        }];
        UIAlertAction *greenAction = [UIAlertAction actionWithTitle:@"Green" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [defaults setObject:@"green" forKey:@"themeColor"];
            [self themeManagement];
        }];
        UIAlertAction *purpleAction = [UIAlertAction actionWithTitle:@"Purple" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [defaults setObject:@"purple" forKey:@"themeColor"];
            [self themeManagement];
        }];
        //Add all the actions to the sheet
        [themeChooser addAction:dynamicAction];
        [themeChooser addAction:blueAction];
        [themeChooser addAction:redAction];
        [themeChooser addAction:greenAction];
        [themeChooser addAction:purpleAction];
        [self presentViewController:themeChooser animated:true completion:nil];
    }
    
}


- (IBAction)playSound:(id)sender
{
	if (soundSelected == 1) {
		NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/FAIL.mp3", [[NSBundle mainBundle] resourcePath]]];
		
		NSError *error;
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		audioPlayer.numberOfLoops = 0;
		
		[audioPlayer play];
	}
	
	if (soundSelected == 2) {
		
		NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/EPIC FAIL.mp3", [[NSBundle mainBundle] resourcePath]]];
		
		NSError *error;
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		audioPlayer.numberOfLoops = 0;
		
		
		[audioPlayer play];
		
		
	}
	
	if (soundSelected == 3) {
		
		NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/WIN.mp3", [[NSBundle mainBundle] resourcePath]]];
		
		NSError *error;
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		audioPlayer.numberOfLoops = 0;
		
		
		[audioPlayer play];
		
		
		
		
	}
	if (soundSelected == 4) {
		
		NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/PWNED.mp3", [[NSBundle mainBundle] resourcePath]]];
		
		NSError *error;
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		audioPlayer.numberOfLoops = 0;
		
		
		
		[audioPlayer play];
		
		
		
	}
	
	if (soundSelected == 5) {
		
		NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/failure.mp3", [[NSBundle mainBundle] resourcePath]]];
		
		NSError *error;
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		audioPlayer.numberOfLoops = 0;
		
		
		[audioPlayer play];
	}
	if (soundSelected == 6) {
		NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/You Fail.mp3", [[NSBundle mainBundle] resourcePath]]];
		
		NSError *error;
		audioPlayer= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		audioPlayer.numberOfLoops = 0;
		
		[audioPlayer play];
	}
    if (soundSelected == 7) {
        NSURL *url  = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/So Many Friends.mp3", [[NSBundle mainBundle] resourcePath]]];
        NSError *error;
        audioPlayer= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
    }
    if (soundSelected == 8) {
       
        


       NSURL *url  = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/AIRHORN.mp3", [[NSBundle mainBundle] resourcePath]]];
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
       [_Santa setHidden:YES];
        
    }
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    
    long failNumber = [[NSUbiquitousKeyValueStore defaultStore]doubleForKey:@"failAmount"];
    failNumber = failNumber + 1;
    NSLog(@"%d",failNumber);
    [[NSUbiquitousKeyValueStore defaultStore]setLongLong:failNumber forKey:@"failAmount"];
    //[defaults setInteger:number forKey:@"FailAmount"];
    [defaults synchronize];
	
}
-(IBAction)Info:(id)sender
{
    InfoViewController *IVC = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    
    IVC.image = bgImage;
    IVC.buttonImage = failimage;
    
    [self presentViewController:IVC animated:YES completion:nil];
    themeSelected = 1;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show" style:UIBarButtonItemStylePlain target:self action:nil];
    //self.parentViewController.navigationItem.rightBarButtonItem = anotherButton;
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://itunes.apple.com/us/app/ufail-universal/id400772299?mt=8"]];
    }
    else if(buttonIndex == 2)
    {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"update72"];
    }
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if([[segue identifier]isEqualToString:@"showInfo"])
        {
            self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:nil action:nil];
            InfoViewController *infovc = [segue destinationViewController];
            
            UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Support" style:UIBarButtonItemStylePlain target:self action:@selector(supportViewController:)];
            self.navigationItem.rightBarButtonItem = anotherButton;
            [anotherButton setTintColor:[UIColor blackColor]];
            /**infovc.image = bgImage;
            infovc.buttonImage = failimage;**/
            [infovc setImage:bgImage];
            [infovc setButtonImage:failimage];
        }
    } else {
        InfoViewController *info = [segue destinationViewController];
        [info setImage:bgImage];
        [info setButtonImage:failimage];
    }
    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)CloseMessage:(id)sender
{
    
    [UIView animateWithDuration:.8 animations:^{
        if(messageActive){
            messageView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height + 328));
        }
        else{
            colorView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height + 328));
        }
        
        _blurEffect.center = CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height + self.view.frame.size.height));
    }completion:^(BOOL finished){
        if(messageActive){
            messageActive = false;
        }
        [messageView setHidden:YES];
        [_blurEffect setHidden:YES];
    }];

    
}

- (IBAction)FailiPad:(id)sender {
    soundSelected = 1;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];
    
   
}

- (IBAction)EpicFailiPad:(id)sender {
    soundSelected =2;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];

}

- (IBAction)WiniPad:(id)sender {
    soundSelected = 3;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];

    
}

- (IBAction)PwnediPad:(id)sender {
    soundSelected =4;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];

    
}

- (IBAction)FailureiPad:(id)sender {
    soundSelected =5;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];

    
}

- (IBAction)uFailiPad:(id)sender {
    
    soundSelected = 6;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];

}

- (IBAction)SoManyFriendsiPad:(id)sender {
    soundSelected = 7;
    [messageView setHidden:YES];
    [FailButton setImage:failimage forState:nil];
    [_blurEffect setHidden:YES];

}

- (IBAction)BlueThemeiPad:(id)sender {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    [colorView setHidden:YES];
    [defaults setObject:@"blue" forKey:@"themeColor"];
    [self themeManagement];
    [_blurEffect setHidden:YES];
    
}

- (IBAction)RedThemeiPad:(id)sender {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    [colorView setHidden:YES];
    [defaults setObject:@"red" forKey:@"themeColor"];
    [self themeManagement];
    [_blurEffect setHidden:YES];
}

- (IBAction)GreenThemeiPad:(id)sender {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    [colorView setHidden:YES];
    [defaults setObject:@"green" forKey:@"themeColor"];
    [self themeManagement];
    [_blurEffect setHidden:YES];
}

- (IBAction)PurpleThemeiPad:(id)sender {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    [colorView setHidden:YES];
    [defaults setObject:@"purple" forKey:@"themeColor"];
    [self themeManagement];
    [_blurEffect setHidden:YES];
    
}
-(IBAction)HolidayThemeiPad:(id)sender
{
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    [defaults setObject:@"winter" forKey:@"themeColor"];
    [self themeManagement];
    [colorView setHidden:YES];
    [_blurEffect setHidden:YES];

    
}

- (IBAction)CloseColor:(id)sender {
    
    //[self dismissTheme];
}

- (IBAction)updateuFail:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/ufail-universal/id400772299?mt=8"]]];
    
}

- (IBAction)HolidaySound:(id)sender {
    soundSelected = 8;
    
    failimage = [UIImage imageNamed:@"Air Horn.png"];
    //[backgroundImage setImage:bgImage];
    [FailButton setImage:failimage forState:nil];
    
    [messageView setHidden:YES];
    [_blurEffect setHidden:YES];
}

- (IBAction)AirHorn:(id)sender {
    
    soundSelected = 8;
    [FailButton setImage:[UIImage imageNamed:@"Air Horn.png"]forState:nil];
    [messageView setHidden:YES];
    [_blurEffect setHidden:YES];
}
-(void)dismissTheme
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        
        if(UIInterfaceOrientationIsPortrait([UIDevice currentDevice].orientation))
        {
            //colorView.center =  CGPointMake(384.0f,300.0f);
            
            [UIView animateWithDuration:0.5 animations:^{colorView.center = CGPointMake(384.0f, 2048.0f);}];
            NSLog(@"portrait");
            [colorView setHidden:YES];
        }
        else if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
        {
            NSLog(@"landscape");
            
            colorView.center =  CGPointMake(512.0f,300.0f);
            
            [UIView animateWithDuration:0.5 animations:^{colorView.center = CGPointMake(512.0f, 1024.0f);}];
            [colorView setHidden:YES];
            
        }
        
        
    }
    else if(iPhone6 == true)
    {
        [colorView setHidden:NO];
        if(iPhoneVersion==6)
        {
            colorView.center =  CGPointMake(187.5f,668.0f);
            
            [UIView animateWithDuration:.4 animations:^{
                
                messageView.center = CGPointMake((self.view.frame.size.width/2), (self.view.frame.size.height + 128));
                _blurEffect.center = CGPointMake((self.view.frame.size.width/2),(self.view.frame.size.height + 128));
            }];
            
        }
        else if(iPhoneVersion==61)
        {
            colorView.center =  CGPointMake(207.0f,738.0f);
            
            [UIView animateWithDuration:0.5 animations:^{colorView.center = CGPointMake(207.0f, 368.0f);}];
        }
        
        
    }

}

-(void)applewatch
{
    
    NSError *error;
    NSString *getWebInfo = @"https://dl.dropboxusercontent.com/u/9291112/uFailVersion.html";
    NSString *uappsnewsWeb = @"https://dl.dropboxusercontent.com/u/9291112/uApps%20News.html";
    NSString *webFormat;
    NSURL *webUnformat =[NSURL URLWithString:getWebInfo];
    NSURL *unformated = [NSURL URLWithString:uappsnewsWeb];
    NSString *uAppsNewsString;
    
    @try{
        webFormat = [NSString stringWithContentsOfURL:webUnformat encoding:NSASCIIStringEncoding error:&error];
       uAppsNewsString =[NSString stringWithContentsOfURL:unformated encoding:NSASCIIStringEncoding error:&error];
    }
    @catch(NSException *exception)
    {
    }

    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.uapps.ufail"];
    
    //[sharedDefaults setInteger:2 forKey:@"MyNumberKey"];
    [sharedDefaults setValue:webFormat forKey:@"NewestVersion"];
    [sharedDefaults setValue:uAppsNewsString forKey:@"uAppsNews"];
    [sharedDefaults synchronize];
    
}

-(void)dismissMessage
{
}
- (IBAction)testTimer:(id)sender {
}
- (IBAction)viewButton:(id)sender {
    
    if(messageActive)
    {
        [messageView setHidden:YES];
        
    }
    else{
        [colorView setHidden:YES];
    }
    [messageView setHidden:YES];
    [colorView setHidden:YES];
    [_blurEffect setHidden:YES];
    
}
@end
