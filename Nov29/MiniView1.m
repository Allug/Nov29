//
//  MiniView1.m
//  Nov29
//
//  Created by Phillip Gulla on 11/19/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import "MiniView1.h"

@implementation MiniView1


- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		//self.backgroundColor = [UIColor blueColor];
		self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"ourmanflint1.png"]];
			
		danceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
		
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(60, 60);	//size of button
		
		danceButton.frame = CGRectMake(
                                       b.origin.x + 200,
                                       b.origin.y + (b.size.height)/2 - s.height,
                                       s.width,
                                       s.height
                                       );

		
		[danceButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
		//[danceButton setBackgroundColor:[UIColor orangeColor]];
		[danceButton setTitle: @"Groovy!" forState:UIControlStateNormal];		
		
		
		[danceButton
         addTarget:[UIApplication sharedApplication].delegate
         action:@selector(touchUpInside:)
         forControlEvents:UIControlEventTouchUpInside];
		
		[self addSubview: danceButton];
	
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	//Print the name of the class.  See the main function in main.m.
	/*
	NSString *string = NSStringFromClass([self class]);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: CGPointZero withFont: font];
	*/
}


@end
