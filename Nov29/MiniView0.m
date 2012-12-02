//
//  MiniView0.m
//  Nov29
//
//  Created by Phillip Gulla on 11/19/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import "MiniView0.h"

@implementation MiniView0

- (id) initWithFrame: (CGRect) frame {
	
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
	self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"ourmanflint0.png"]];
			
		ringtoneButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		
		musicSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
		if (musicSwitch == nil) {
			return nil;
		
		}
				
		//Position the button in the view - PG 112012
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
		
		ringtoneButton.frame = CGRectMake(b.origin.x + (b.size.width - s.width) / 2,
								  b.origin.y =410,
								  s.width,
								  s.height
								  );	
		
		//Position the switch in the view - PG 120112		
		musicSwitch.center =CGPointMake(b.origin.x + (b.size.width - s.width) / 2,
										b.origin.y =310);
						
		[ringtoneButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
			
		[ringtoneButton setTitle: @"Ringtone" forState: UIControlStateNormal];
		
		[ringtoneButton addTarget: [UIApplication sharedApplication].delegate
						   action: @selector(touchUpInside:)
				 forControlEvents: UIControlEventTouchUpInside];
		 
		
		[musicSwitch
         addTarget:[UIApplication sharedApplication].delegate
         action:@selector(valueChanged:)
         forControlEvents:UIControlEventValueChanged];
        musicSwitch.on = NO;
		
		
		[self addSubview: ringtoneButton];
		[self addSubview: musicSwitch];
	}

	return self;
	
}

@end
