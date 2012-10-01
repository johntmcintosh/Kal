//
//  KalGridView+JTExtension.m
//  KalTest
//
//  Created by John McIntosh on 10/1/12.
//  Copyright (c) 2012 John McIntosh. All rights reserved.
//

#import "KalGridView+JTExtension.h"
#import "KalTileView.h"
#import "KalDate.h"
#import "NSDateAdditions.h"
#import <objc/runtime.h>


@implementation KalGridView (JTExtension)
@dynamic jtKalViewDelegate;

static char JTKALDELEGATE_KEY;

+ (void)load
{
    // The "+ load" method is called once, very early in the application life-cycle.
    // It's called even before the "main" function is called. Beware: there's no
    // autorelease pool at this point, so avoid Objective-C calls.
    Method original, swizzle;
    
    // Get the "- (id)initWithFrame:" method.
    original = class_getInstanceMethod(self, @selector(receivedTouches:withEvent:));
    // Get the "- (id)swizzled_initWithFrame:" method.
    swizzle = class_getInstanceMethod(self, @selector(swizzled_receivedTouches:withEvent:));
    // Swap their implementations.
    method_exchangeImplementations(original, swizzle);
}

- (void)swizzled_receivedTouches:(NSSet *)touches withEvent:event
{
    // Call original method
    [self swizzled_receivedTouches:touches withEvent:event];
    
    // My addition
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    UIView *hitView = [self hitTest:location withEvent:event];
    
    if (!hitView)
        return;
    
    if ([hitView isKindOfClass:[KalTileView class]]) {
        KalTileView *tile = (KalTileView*)hitView;
        
        KalDate *date = tile.date;
        [self.jtKalViewDelegate userDidTapDate:date];
    }
}



- (void)setJtKalViewDelegate:(id<JTKalViewDelegate>)jtKalViewDelegate
{
    objc_setAssociatedObject(self, &JTKALDELEGATE_KEY, jtKalViewDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<JTKalViewDelegate>)jtKalViewDelegate
{
    return (id<JTKalViewDelegate>)objc_getAssociatedObject(self, &JTKALDELEGATE_KEY);
}

- (void)dealloc
{
    self.jtKalViewDelegate = nil;
}

@end
