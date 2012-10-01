//
//  JTDateVC.m
//  KalTest
//
//  Created by John McIntosh on 9/4/12.
//  Copyright (c) 2012 John McIntosh. All rights reserved.
//

#import "JTDateVC.h"

@interface JTDateVC ()

@end

@implementation JTDateVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    self.dataSource = self;
    self.jtKVCDelegate = self;
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - KalDataSource

- (void)presentingDatesFrom:(NSDate *)fromDate to:(NSDate *)toDate delegate:(id<KalDataSourceCallbacks>)delegate_
{
    [delegate_ loadedDataSource:self];
}

- (NSArray *)markedDatesFrom:(NSDate *)fromDate to:(NSDate *)toDate
{
    return @[ [NSDate date] ];
}

- (void)loadItemsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSLog(@"Day selected: %@ to %@", fromDate, toDate);
}

- (void)removeAllItems
{
    
}

#pragma mark - JTKalViewControllerDelegate

- (void)kalViewController:(JTKalViewController *)kalVC userDidTapFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSLog(@"USER DID TAP");
}

@end
