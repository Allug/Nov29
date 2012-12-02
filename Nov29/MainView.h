//
//  MainView.h
//  Nov29
//
//  Created by Phillip Gulla on 11/19/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainView: UIView {
	//holds the two subviews we transtion between
	NSArray *views;
		
	//index in views of the currently displayed little view: 0 or 1
	NSUInteger index;
}

@end
