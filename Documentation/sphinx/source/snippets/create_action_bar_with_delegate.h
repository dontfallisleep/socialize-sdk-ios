// Header

// Store the action bar in a property on your view controller

#import <Socialize/Socialize.h>

@interface CreateActionBarWithDelegateViewController : UIViewController <SZActionBarDelegate>
@property (nonatomic, retain) SZActionBar *actionBar;
@end