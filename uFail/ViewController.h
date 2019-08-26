//
//  ViewController.h
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/11/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@import SpriteKit;

@interface ViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    
    BOOL *update72;
    BOOL *whatTheme;

}
@property (strong, nonatomic) IBOutlet UIButton *FailButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property(weak,nonatomic)IBOutlet UIImageView *screenBackgroundImage;
@property(weak,nonatomic)IBOutlet UIView *messageView;
@property(weak,nonatomic)IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIView *iPhone6Message;
@property (nonatomic)BOOL *theme;
@property (weak, nonatomic) IBOutlet UIButton *UpdateButton;
@property (weak, nonatomic) IBOutlet UIButton *HolidaySoundButton;
@property (weak, nonatomic) IBOutlet SKView *particleBackground;
@property (weak, nonatomic) IBOutlet UIView *Santa;
@property (strong, nonatomic) IBOutlet UILabel *updateLabel;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurEffect;
- (IBAction)viewButton:(id)sender;

@property(nonatomic)UIImage *bgImage;
@property(nonatomic)UIImage *buttonImage;
-(IBAction)pickSound:(id)sender;
-(IBAction)playSound:(id)sender;
-(IBAction)pickColor:(id)sender;
-(IBAction)Info:(id)sender;
- (IBAction)CloseMessage:(id)sender;




- (IBAction)FailiPad:(id)sender;
- (IBAction)EpicFailiPad:(id)sender;
- (IBAction)WiniPad:(id)sender;
- (IBAction)PwnediPad:(id)sender;
- (IBAction)FailureiPad:(id)sender;
- (IBAction)uFailiPad:(id)sender;
- (IBAction)SoManyFriendsiPad:(id)sender;
- (IBAction)BlueThemeiPad:(id)sender;
- (IBAction)RedThemeiPad:(id)sender;
- (IBAction)GreenThemeiPad:(id)sender;
- (IBAction)PurpleThemeiPad:(id)sender;
-(IBAction)HolidayThemeiPad:(id)sender;
- (IBAction)CloseColor:(id)sender;
- (IBAction)updateuFail:(id)sender;
- (IBAction)HolidaySound:(id)sender;
- (IBAction)AirHorn:(id)sender;
-(void)loadTheme;
@property (strong, nonatomic) IBOutlet UILabel *TestCountdown;








@end
