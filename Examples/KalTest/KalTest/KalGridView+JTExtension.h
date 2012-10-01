//
//  KalGridView+JTExtension.h
//  KalTest
//
//  Created by John McIntosh on 10/1/12.
//  Copyright (c) 2012 John McIntosh. All rights reserved.
//

#import "KalGridView.h"

@protocol JTKalViewDelegate <NSObject>
- (void)userDidTapDate:(KalDate *)date;
@end

@interface KalGridView (JTExtension)

@property (nonatomic, weak) id<JTKalViewDelegate> jtKalViewDelegate;

@end
