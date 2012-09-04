//
//  ViewController.m
//  KalTest
//
//  Created by John McIntosh on 9/4/12.
//  Copyright (c) 2012 John McIntosh. All rights reserved.
//

#import "ViewController.h"
#import "Kal.h"
#import "JTKalViewController.h"
#import "JTDateVC.h"

@interface ViewController ()
@property(nonatomic, strong) UIPopoverController *popController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)kalBtnPressed:(id)sender
{
    KalViewController *kvc = [[KalViewController alloc] initWithSelectedDate:[NSDate date]];
    UIPopoverController *pc = [[UIPopoverController alloc] initWithContentViewController:kvc];
    self.popController = pc;
    [pc presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2,
                                          self.view.frame.size.height/2,
                                          1,
                                          1)
                        inView:self.view
      permittedArrowDirections:0
                      animated:YES];
}

- (IBAction)customKalBtnPressed:(id)sender
{
    JTKalViewController *kvc = [[JTKalViewController alloc] initWithSelectedDate:[NSDate date]];
    UIPopoverController *pc = [[UIPopoverController alloc] initWithContentViewController:kvc];
    self.popController = pc;
    [pc presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2,
                                          self.view.frame.size.height/2,
                                          1,
                                          1)
                        inView:self.view
      permittedArrowDirections:0
                      animated:YES];
}

- (IBAction)customNavKalBtnPressed:(id)sender
{
    JTDateVC *kvc = [[JTDateVC alloc] initWithSelectedDate:[NSDate date]];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:kvc];
    UIPopoverController *pc = [[UIPopoverController alloc] initWithContentViewController:navC];
    self.popController = pc;
    [pc presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2+100,
                                          self.view.frame.size.height/2-100,
                                          1,
                                          1)
                        inView:self.view
      permittedArrowDirections:0
                      animated:YES];
}


@end
