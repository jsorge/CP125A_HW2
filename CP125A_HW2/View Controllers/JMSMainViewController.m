//
//  JMSMainViewController.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSMainViewController.h"
#import "JMSRedViewController.h"
#import "JMSBlueViewController.h"
#import "JMSGreenViewController.h"
#import "JMSCustomViewController.h"
#import "JMSRandomViewController.h"
#import "UIColor+UWExtensions.h"

@interface JMSMainViewController () <UITextFieldDelegate>
@property (strong, nonatomic)JMSRedViewController *redVC;
@property (strong, nonatomic)JMSBlueViewController *blueVC;
@property (strong, nonatomic)JMSGreenViewController *greenVC;
@property (strong, nonatomic)JMSCustomViewController *customVC;
@property (strong, nonatomic)JMSRandomViewController *randomVC;
@property (weak, nonatomic) IBOutlet UITextField *customRedTextField;
@property (weak, nonatomic) IBOutlet UITextField *customGreenTextField;
@property (weak, nonatomic) IBOutlet UITextField *customBlueTextField;
@end

@implementation JMSMainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Colors";
        self.tabBarItem.image = [UIImage imageNamed:@"ColorsTab"];
    }
    return self;
}

#pragma mark - Properties
- (JMSRedViewController *)redVC
{
    if (!_redVC) {
        _redVC = [[JMSRedViewController alloc] init];
    }
    return _redVC;
}

- (JMSBlueViewController *)blueVC
{
    if (!_blueVC) {
        _blueVC = [[JMSBlueViewController alloc] init];
    }
    return _blueVC;
}

- (JMSGreenViewController *)greenVC
{
    if (!_greenVC) {
        _greenVC = [[JMSGreenViewController alloc] init];
    }
    return _greenVC;
}

- (JMSCustomViewController *)customVC
{
    if (!_customVC) {
        _customVC = [[JMSCustomViewController alloc] init];
    }
    return _customVC;
}

- (JMSRandomViewController *)randomVC
{
    if (!_randomVC) {
        _randomVC = [[JMSRandomViewController alloc] init];
    }
    return _randomVC;
}

#pragma mark - IBActions
- (IBAction)redButton:(id)sender
{
    [self presentViewController:self.redVC animated:YES completion:nil];
}

- (IBAction)greenButton:(id)sender
{
    [self presentViewController:self.greenVC animated:YES completion:nil];
}

- (IBAction)blueButton:(id)sender
{
    [self presentViewController:self.blueVC animated:YES completion:nil];
}

- (IBAction)customButton:(id)sender
{
    CGFloat customRed = (CGFloat)[self.customRedTextField.text floatValue];
    CGFloat customBlue = (CGFloat)[self.customBlueTextField.text floatValue];
    CGFloat customGreen = (CGFloat)[self.customGreenTextField.text floatValue];
    UIColor *customColor = [UIColor colorWithRed:customRed
                                           green:customGreen
                                            blue:customBlue
                                           alpha:1.0];
    [self.customVC changeBackgroundColorToColor:customColor];
    [self presentViewController:self.customVC animated:YES completion:nil];
}

- (IBAction)randomButton:(id)sender
{
    [self.randomVC changeBackgroundColorToColor:[UIColor uw_randomColor]];
    [self presentViewController:self.randomVC animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
