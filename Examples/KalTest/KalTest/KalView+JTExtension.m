//
//  KalView+JTExtension.m
//  KalTest
//
//  Created by John McIntosh on 9/4/12.
//  Copyright (c) 2012 John McIntosh. All rights reserved.
//

#import "KalView+JTExtension.h"
#import "KalGridView.h"

@implementation KalView (JTExtension)

- (KalGridView *)gridView
{
    return [self gridViewInSubviewsOfView:self];
}

- (KalGridView *)gridViewInSubviewsOfView:(UIView *)rootView
{
    if ([rootView isKindOfClass:[KalGridView class]]) {
        return (KalGridView *)rootView;
    }
    
    NSArray *subviews = rootView.subviews;
    for (UIView *subview in subviews) {

        KalGridView *gv = [self gridViewInSubviewsOfView:subview];
        if (gv) {
            return gv;
        }
    }
    return nil;
}

@end
