//
//  Nov29AppDelegate.m
//  Nov29
//
//  Created by Phillip Gulla on 11/18/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import "Nov29AppDelegate.h"
#import "MainView.h"
#import "MiniView0.h"
#import "MiniView1.h"

@implementation Nov29AppDelegate
@synthesize window = _window;


- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	// Override point for customization after application launch.
	NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);
			
	NSString *filename = [bundle pathForResource: @"Flint_Phone" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filename);
	
	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
	
	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
	
	
	//NSBundle *themeBundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundelPath == \"%@\"", bundle.bundlePath);
	
	NSString *themeFilename = [bundle pathForResource: @"Flint_Theme" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", themeFilename);
	
	NSURL *themeURL = [NSURL fileURLWithPath: themeFilename isDirectory: NO];
	NSLog(@"url == \"%@\"", themeURL);
	
	NSError *themeError = nil;
	themePlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: themeURL error: &themeError];

	UIScreen *screen = [UIScreen mainScreen];
	mainView = [[MainView alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
		
	NSString *movieFilename = [bundle pathForResource:@"flint_dance" ofType:@"mov"];
    
    NSURL *movieURL = [NSURL fileURLWithPath:movieFilename];
    if (movieURL == nil) {
        NSLog(@"could not create URL for file %@", movieFilename);
    }
    
	danceController = [[MPMoviePlayerController alloc] init];
    
    if (danceController == nil) {
        NSLog(@"could not createMPMoviePlayerController");
		return YES;
    }
	
		danceController.shouldAutoplay = NO;
		danceController.scalingMode = MPMovieScalingModeNone;
		danceController.controlStyle = MPMovieControlStyleDefault;
		danceController.movieSourceType = MPMovieSourceTypeFile;
		[danceController setContentURL:movieURL];
		
		NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
		[center
		 addObserver:self
		 selector:@selector(playbackDidFinish:)
		 name:MPMoviePlayerPlaybackDidFinishNotification
		 object:danceController];
	
	
	[self.window makeKeyAndVisible];
	[self.window addSubview: mainView];
	[self.window addSubview: miniView0];
	//[self.window addSubview: miniView1];
	
	return YES;
}


-(void) touchUpInside: (id) sender {
	if ([sender titleForState:UIControlStateNormal] == @"Ringtone"){
	AudioServicesPlaySystemSound(sid);
}

	if ([sender titleForState:UIControlStateNormal] == @"Groovy!") {
        danceController.view.frame = mainView.frame;
        [mainView removeFromSuperview];
        [self.window addSubview:danceController.view];
        [danceController play];
}
	
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
}

- (void) valueChanged: (id) sender {
	UISwitch *s = sender;
	if (s.isOn) {
		//The UISwitch has just been turned on.
		if (![themePlayer play]) {
			NSLog(@"[player play] failed.");
		}
		NSLog(@"Playing at %g of %g seconds.", themePlayer.currentTime, themePlayer.duration);
	} else {
		//The UISwitch has just been turned off.
		NSLog(@"Paused at %g of %g seconds.", themePlayer.currentTime, themePlayer.duration);
		[themePlayer pause];
		
		if (![themePlayer prepareToPlay]) {
			NSLog(@"prepareToPlay failed");
		}
		
		UISwitch *sOff = sender;
		if (!sOff.isOn) {
			[themePlayer stop];		
								
		}
	}
}


-(void) playbackDidFinish: (NSNotification *) notification {
    [danceController.view removeFromSuperview];
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self.window addSubview: mainView];
}

- (void) dealloc {
	OSStatus error = AudioServicesDisposeSystemSoundID(sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesDisposeSystemSoundID error == %ld", error);
	}
}


- (void)applicationWillResignActive:(UIApplication *)application
{
		exit (0);
	
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	[themePlayer stop];
	[danceController stop];
			
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
		
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
