//
//  DPScrollingLabel.h
//  
//The MIT License (MIT)
//Copyright (c) 2012 Daniel Pourhadi
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


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
