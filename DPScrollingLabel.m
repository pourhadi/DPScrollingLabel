//
//  DPScrollingLabel.m
//  
//
//  Created by Dan Pourhadi on 8/2/12.
//
//

#import "DPScrollingLabel.h"

@implementation ScrollingLabel
@synthesize textColor=_textColor, font=_font, highlightedTextColor=_highlightedTextColor, text=_text;
@synthesize pauseTime=_pauseTime, scrollTime=_scrollTime, textDistance=_textDistance;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

		self.showsHorizontalScrollIndicator = self.showsVerticalScrollIndicator = NO;
		self.scrollsToTop = NO;
		self.userInteractionEnabled = NO;
		
		first = YES;
		
		_scrollTime = SCROLL_TIME;
		_textDistance = TEXT_DISTANCE;
		_pauseTime = PAUSE_TIME;
		
    }
    return self;
}


-(void)setTextDistance:(CGFloat)textDistance
{
	if (textDistance!=_textDistance)
	{
		_textDistance = textDistance;
	}
}

-(void)setPauseTime:(CGFloat)pauseTime
{
	if (pauseTime!=_pauseTime)
	{
		_pauseTime = pauseTime;
	}
}

-(void)setScrollTime:(CGFloat)scrollTime
{
	if (scrollTime!=_scrollTime)
	{
		_scrollTime = scrollTime;
	}
}

-(void)setFrame:(CGRect)frame
{
	[super setFrame:frame];
	
	[self adjustLabels];
}

-(void)adjustLabels
{
	scrolling = NO;
	[self.layer removeAllAnimations];
	scrollAnimation = nil;
	
	[firstLabel removeFromSuperview];
	firstLabel = nil;
	[secondLabel removeFromSuperview];
	secondLabel = nil;
	
	firstLabel = [[UILabel alloc] initWithFrame:self.frame];
	firstLabel.textColor = self.textColor;
	firstLabel.font = self.font;
	firstLabel.highlightedTextColor = self.highlightedTextColor;
	firstLabel.textAlignment = UITextAlignmentLeft;
	firstLabel.backgroundColor = [UIColor clearColor];
	firstLabel.text = self.text;
	[firstLabel sizeToFit];
	
	CGRect r = firstLabel.frame;
	r.origin.x = 0;
	r.origin.y = 0;
	r.size.height = self.frame.size.height;
	firstLabel.frame = r;
	
	[self addSubview:firstLabel];
	needsScroll = NO;
	self.contentSize = self.frame.size;
	
		if ([firstLabel.text sizeWithFont:firstLabel.font].width > self.frame.size.width+3)
		{
			secondLabel = [[UILabel alloc] initWithFrame:firstLabel.frame];
			
			secondLabel.text = firstLabel.text;
			secondLabel.font = firstLabel.font;
			secondLabel.textColor =firstLabel.textColor;
			secondLabel.highlightedTextColor = firstLabel.highlightedTextColor;
			secondLabel.textAlignment = firstLabel.textAlignment;
			secondLabel.backgroundColor = [UIColor clearColor];
			self.contentSize = CGSizeMake(firstLabel.frame.size.width + self.textDistance + secondLabel.frame.size.width, self.frame.size.height);
			
			r = secondLabel.frame;
			r.origin.x = firstLabel.frame.size.width + self.textDistance;
			secondLabel.frame = r;
			
			[self addSubview:secondLabel];
			needsScroll =YES;
		}
		
}
-(void)setText:(NSString *)text
{
	if (![text isEqualToString:_text])
	{
		first = YES;
		_text = text;
		[self adjustLabels];
		
		if (needsScroll)
			[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scroll) userInfo:nil repeats:NO];

	}
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	[self.layer removeAllAnimations];
	scrollAnimation = nil;
	
	[self adjustLabels];
	[NSTimer scheduledTimerWithTimeInterval:self.pauseTime target:self selector:@selector(scroll) userInfo:nil repeats:NO];

}

-(void)scroll
{
	if (!scrolling)
	{
		CGRect nb = self.layer.bounds;
		nb.origin.x += firstLabel.frame.size.width + self.textDistance;
		

	scrollAnimation=[CABasicAnimation animationWithKeyPath:@"bounds"];
	scrollAnimation.duration=(firstLabel.frame.size.width + self.textDistance) / 50;
	scrollAnimation.delegate = self;
		scrollAnimation.toValue = [NSValue valueWithCGRect:nb];
	[self.layer addAnimation:scrollAnimation forKey:@"animateBounds"];

		scrolling = YES;
	}
}

-(void)setTextColor:(UIColor *)textColor
{
	if (textColor != _textColor)
	{
		_textColor = textColor;
	
		if (firstLabel)
		firstLabel.textColor = textColor;
		if (secondLabel)
		secondLabel.textColor = textColor;
	}
}

-(void)setFont:(UIFont *)font
{
	if (font != _font)
	{
		_font = font;
		if (firstLabel)
		firstLabel.font = font;
		
		if (secondLabel) secondLabel.font = font;
	}
}

-(void)setHighlightedTextColor:(UIColor *)highlightedTextColor
{
	if (highlightedTextColor != _highlightedTextColor)
	{
		_highlightedTextColor = highlightedTextColor;
		if (firstLabel)
		firstLabel.highlightedTextColor = highlightedTextColor;
		
		if(secondLabel) secondLabel.highlightedTextColor = highlightedTextColor;
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
