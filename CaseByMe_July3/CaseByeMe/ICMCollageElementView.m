//
//  ICMCollageElementView.m
//  InstagramCollageMaker
//
//  Created by  mrhard on 11.04.14.
//  Copyright (c) 2014 Azoft. All rights reserved.
//

#import "ICMCollageElementView.h"

@interface ICMCollageElementView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ICMCollageElementView

@dynamic image;

- (id)init {
    if ((self = [super init])) {
        self.backgroundColor = [UIColor clearColor];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _scrollView.delegate = self;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_scrollView];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_scrollView addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setMaxMinZoomScalesForCurrentBounds];
}

#pragma mark - Actions

- (void)onScrollViewTap:(id)sender {
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - helpers

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
    self.textLabel.hidden = image != nil;
    
    CGRect frame = self.imageView.frame;
    frame.size = image.size;
    self.imageView.frame = frame;
    
//    self.scrollView.contentSize = image.size;
    
    self.scrollView.minimumZoomScale=0.5;
    
    self.scrollView.maximumZoomScale=6.0;
    
    self.scrollView.contentSize=CGSizeMake(self.frame.size.width+100, self.frame.size.height+100);
    
    [self setMaxMinZoomScalesForCurrentBounds];
}

- (UIImage *)image
{
    return self.imageView.image;
}

#pragma mark - UIScrollViewStaff

- (void)setMaxMinZoomScalesForCurrentBounds {
	self.scrollView.maximumZoomScale = 5;
	self.scrollView.minimumZoomScale = 0.1;
}


- (CGRect)zoomRectForScrollView:(UIScrollView *)scrollView withScale:(float)scale withCenter:(CGPoint)center {
    
    
    
    CGRect zoomRect;
    // The zoom rect is in the content view's coordinates.
    
    // At a zoom scale of 1.0, it would be the size of the
    
    // imageScrollView's bounds.
    
    // As the zoom scale decreases, so more content is visible,
    
    // the size of the rect grows.
    
    zoomRect.size.height = scrollView.frame.size.height / scale;
    
    zoomRect.size.width  = scrollView.frame.size.width  / scale;
    
    
    
    // choose an origin so as to get the right center.
    
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    
    
    return zoomRect;
    
}


#pragma mark UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
