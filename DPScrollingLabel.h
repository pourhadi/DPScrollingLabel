//
//  DPScrollingLabel.h
//  
//
//  Created by Dan Pourhadi on 8/2/12.
//
//

#import <UIKit/UIKit.h>
#define TEXT_DISTANCE 30.0
#define SCROLL_TIME 5.0
#define PAUSE_TIME 4.0
@interface ScrollingLabel : UIScrollView
{
	UILabel *firstLabel;
	UILabel *secondLabel;
	
	BOOL scrolling;
	
	CABasicAnimation *scrollAnimation;
	
	BOOL first;
	
	BOOL needsScroll;
}

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *highlightedTextColor;
@property (nonatomic) CGFloat textDistance;
@property (nonatomic) CGFloat pauseTime;
@property (nonatomic) CGFloat scrollTime;

-(void)scroll;
-(void)adjustLabels;
@end
