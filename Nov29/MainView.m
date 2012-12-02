//
//  MainView.m
//  Nov29
//
//  Created by Phillip Gulla on 11/19/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import "MainView.h"
#import "MiniView0.h"
#import "MiniView1.h"


@implementation MainView

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		
		views = [NSArray arrayWithObjects:
				 [[MiniView0 alloc] initWithFrame: self.bounds],
				 [[MiniView1 alloc] initWithFrame: self.bounds],
				 nil
				 ];
		
		index = 0;	//MiniView0 is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
	}
	return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	NSUInteger newIndex = 1 - index;	//toggle the index
	
	[UIView transitionFromView: [views objectAtIndex: index]
						toView: [views objectAtIndex: newIndex]
					  duration: 0.5
					   options: UIViewAnimationOptionTransitionFlipFromBottom
					completion: NULL
	 ];
	
	index = newIndex;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */


@end
