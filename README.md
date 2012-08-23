DPScrollingLabel
================
(for iOS and ARC)

Summary
================
UILabel-like UIScrollView subclass that scrolls horizontally when the length of its text exceeds the length of its frame.

Installation
================
To install, just add DPScrollingLabel.h and .m to your Xcode project.

Usage
================
Initialize an instance of DPScrollingLabel with -initWithFrame: and add it to your view hierarchy.

You can customize the label's font, textColor, and highlightedTextColor. Set the text with -setText:.

And for the scrolling functionality, you can change the distance between the end of the text and the start of its next instance when scrolling.

You can also change the amount of time it pauses before continuing to scroll, as well as the amount of time it takes for a full scroll.