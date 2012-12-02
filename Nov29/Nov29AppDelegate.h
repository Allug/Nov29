//
//  Nov29AppDelegate.h
//  Nov29
//
//  Created by Phillip Gulla on 11/18/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
#import <AVFoundation/AVAudioPlayer.h>
#import <MediaPlayer/MediaPlayer.h>
@class MainView;
@class MiniView0;
@class MiniView1;

@interface Nov29AppDelegate: UIResponder <UIApplicationDelegate> {
	SystemSoundID sid;
	AVAudioPlayer *themePlayer;
	MPMoviePlayerController *danceController;
	MainView *mainView;
	UIWindow *_window;	
	MiniView0 *miniView0;
}

- (void) touchUpInside: (id) sender;
- (void) valueChanged: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
