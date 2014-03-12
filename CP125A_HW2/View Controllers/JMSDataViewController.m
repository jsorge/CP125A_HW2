//
//  JMSDataViewController.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSDataViewController.h"
#import "JMSRedViewController.h"
#import "JMSBlueViewController.h"
#import "JMSGreenViewController.h"
#import "JMSCustomViewController.h"
#import "JMSRandomViewController.h"

@interface JMSDataViewController () <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property (weak, nonatomic) IBOutlet UILabel *customLabel;
@property (weak, nonatomic) IBOutlet UILabel *randomLabel;
@end

@implementation JMSDataViewController

#pragma mark - Init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Data";
        self.tabBarItem.image = [UIImage imageNamed:@"DataTab"];
    }
    return self;
}

#pragma mark - View Lifecycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateCountLabels];
}

#pragma mark - IBActions
- (IBAction)resetCountsButton:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Reset Display Counts?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Reset"
                                                    otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

#pragma mark - Private
- (void)updateCountLabels
{
    self.redLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.redVC.displayCount];
    self.greenLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.greenVC.displayCount];
    self.blueLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.blueVC.displayCount];
    self.customLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.customVC.displayCount];
    self.randomLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.randomVC.displayCount];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        [self.redVC resetDisplayCount];
        [self.greenVC resetDisplayCount];
        [self.blueVC resetDisplayCount];
        [self.customVC resetDisplayCount];
        [self.randomVC resetDisplayCount];
        
        [self updateCountLabels];
    }
}

@end
