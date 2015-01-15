//
//  CommentsTableHeaderView.h
//  appbuildr
//
//  Created by Brian Fallis  on 1/13/11.
//  Copyright 2011 pointabout. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsTableHeaderView : UIView
{
    UISegmentedControl        *commentsLikeSelection;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *commentsLikeSelection;

- (void)hideSubscribedButton;

@end
