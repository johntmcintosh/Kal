//
//  JTKalViewController.h
//  KalTest
//
//  Created by John McIntosh on 9/4/12.
//  Copyright (c) 2012 John McIntosh. All rights reserved.
//

/*
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import <UIKit/UIKit.h>
#import "KalView.h"       // for the KalViewDelegate protocol
#import "KalDataSource.h" // for the KalDataSourceCallbacks protocol

#import "KalGridView+JTExtension.h"

@class KalLogic, KalDate;
@protocol JTKalViewControllerDelegate;

/*
 *    KalViewController
 *    ------------------------
 *
 *  KalViewController automatically creates both the calendar view
 *  and the events table view for you. The only thing you need to provide
 *  is a KalDataSource so that the calendar system knows which days to
 *  mark with a dot and which events to list under the calendar when a certain
 *  date is selected (just like in Apple's calendar app).
 *
 */
@interface JTKalViewController : UIViewController <KalViewDelegate, JTKalViewDelegate, KalDataSourceCallbacks>
{
    KalLogic *logic;
    id <UITableViewDelegate> delegate;
    id <KalDataSource> dataSource;
    NSDate *initialDate;                    // The date that the calendar was initialized with *or* the currently selected date when the view hierarchy was torn down in order to satisfy a low memory warning.
    NSDate *selectedDate;                   // I cache the selected date because when we respond to a memory warning, we cannot rely on the view hierarchy still being alive, and thus we cannot always derive the selected date from KalView's selectedDate property.
}

@property (nonatomic, assign) id<UITableViewDelegate> delegate;
@property (nonatomic, assign) id<KalDataSource> dataSource;
@property (nonatomic, retain, readonly) NSDate *selectedDate;
@property (nonatomic, weak) id<JTKalViewControllerDelegate> jtKVCDelegate;

- (id)initWithSelectedDate:(NSDate *)selectedDate;  // designated initializer. When the calendar is first displayed to the user, the month that contains 'selectedDate' will be shown and the corresponding tile for 'selectedDate' will be automatically selected.
- (void)reloadData;                                 // If you change the KalDataSource after the KalViewController has already been displayed to the user, you must call this method in order for the view to reflect the new data.
- (void)showAndSelectDate:(NSDate *)date;           // Updates the state of the calendar to display the specified date's month and selects the tile for that date.

@end


@protocol JTKalViewControllerDelegate <NSObject>
- (void)kalViewController:(JTKalViewController *)kalVC userDidTapFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
@end