DPScrollingLabel
================

My own implementation of a label that scrolls horizontally when the length of its text exceeds the length of its frame.

To install, just add DPScrollingLabel.h and .m to your Xcode project.

You can customize the label's font, textColor, and highlightedTextColor. Set the text with -setText:.

And for the scrolling functionality, you can change the distance between the end of the text and the start of its next instance when scrolling.

You can also change the amount of time it pauses before continuing to scroll, as well as the amount of time it takes for a full scroll.