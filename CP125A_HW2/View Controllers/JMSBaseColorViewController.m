//
//  JMSBaseColorViewController.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/14/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSBaseColorViewController.h"
#import "UIView+AutoLayout.h"
#import "UIColor+UWExtensions.h"

@interface JMSBaseColorViewController ()
@property (nonatomic, readwrite)NSUInteger displayCount;
@property (strong, nonatomic, readwrite)UILabel *displayCountLabel;

- (void)tapDismissButton;
@end

@implementation JMSBaseColorViewController

#pragma mark - API
- (void)incrementDisplayCount;
{
    self.displayCount += 1;
    self.displayCountLabel.text = [self timesPresentedString];
}

- (void)resetDisplayCount;
{
    self.displayCount = 0;
}

- (instancetype)initWithColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        self.backgroundColor = color;
    }
    return self;
}

- (void)changeBackgroundColorToColor:(UIColor *)color
{
    self.view.backgroundColor = color;
}

#pragma mark - Loading
- (void)viewDidLoad
{    
    self.view.backgroundColor = self.backgroundColor;
    
    //Display Label
    UILabel *countLabel = [UILabel autoLayoutView];
    countLabel.text = [self timesPresentedString];
    countLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:countLabel];
    self.displayCountLabel = countLabel;
    
    //Dismiss button
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    dismissButton.translatesAutoresizingMaskIntoConstraints = NO;
    dismissButton.tintColor = [UIColor uw_invertColor:self.backgroundColor];
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(tapDismissButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    self.dismissButton = dismissButton;
    
    //Auto Layout
    NSDictionary *views = NSDictionaryOfVariableBindings(countLabel, dismissButton);
    NSDictionary *metrics = @{@"height": @50, @"paddingTop": @([UIScreen mainScreen].bounds.size.height/3), @"spacing": @20};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[countLabel]-|"
                                                                      options:NSLayoutFormatAlignAllLeading
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[dismissButton]-|"
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(paddingTop)-[countLabel(height)]-(>=spacing)-[dismissButton(height)]"
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:metrics
                                                                        views:views]];
}

#pragma mark - Private
- (void)tapDismissButton
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)timesPresentedString
{
    NSString *returnString;
    if (self.displayCount == 1) {
        returnString = [NSString stringWithFormat:@"Presented %lu time", (unsigned long)self.displayCount];
    } else {
        returnString = [NSString stringWithFormat:@"Presented %lu times", (unsigned long)self.displayCount];
    }
    return returnString;
}
                                   
#pragma mark - View Lifecycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self incrementDisplayCount];
}
@end
