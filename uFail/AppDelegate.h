//
//  AppDelegate.h
//  uFail Universal
//
//  Created by Matthew Jagiela on 6/11/14.
//  Copyright (c) 2014 Matthew Jagiela. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    AVAudioPlayer *audioPlayer;
}

@property (strong, nonatomic) UIWindow *window;

@end
