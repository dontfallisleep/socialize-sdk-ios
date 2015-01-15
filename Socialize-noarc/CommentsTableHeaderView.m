//
//  CommentsTableFooterView.m
//  appbuildr
//
//  Created by Fawad Haider  on 1/13/11.
//  Copyright 2011 pointabout. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CommentsTableHeaderView.h"



@implementation CommentsTableHeaderView

@synthesize commentsLikeSelection;



-(void)layoutSubviews{
    
    UIImage *clImgNormal;
    UIImage *clImgHighlighted;
    UIImage *clImgDivider;
    
    clImgNormal = [[UIImage imageNamed:@"action-bar-button-red.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    clImgHighlighted = [[UIImage imageNamed:@"action-bar-button-red-hover.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    clImgDivider = [[UIImage imageNamed:@"action-bar-button-red-divider.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    
    [[self commentsLikeSelection] setBackgroundImage:clImgNormal forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[self commentsLikeSelection] setBackgroundImage:clImgHighlighted forState:UIControlStateHighlighted
                                          barMetrics:UIBarMetricsDefault];
    
    [[self commentsLikeSelection] setDividerImage:clImgDivider forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [[self commentsLikeSelection] setDividerImage:clImgDivider forLeftSegmentState:UIControlStateHighlighted rightSegmentState:UIControlStateNormal
                                       barMetrics:UIBarMetricsDefault];

}

- (void)hideSubscribedButton {

    NSLog(@"Hide subscribed button pressed");

}

- (void)dealloc {

    [commentsLikeSelection release];
    [super dealloc];

}
@end
