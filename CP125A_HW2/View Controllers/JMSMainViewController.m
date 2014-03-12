//
//  JMSMainViewController.m
//  CP125A_HW2
//
//  Created by Jared Sorge on 1/15/14.
//  Copyright (c) 2014 JMS. All rights reserved.
//

#import "JMSMainViewController.h"
#import "JMSRedViewController.h"
#import "JMSGreenViewController.h"
#import "JMSBlueViewController.h"
#import "JMSCustomViewController.h"
#import "JMSRandomViewController.h"

@interface JMSMainViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *customRedTextField;
@property (weak, nonatomic) IBOutlet UITextField *customGreenTextField;
@property (weak, nonatomic) IBOutlet UITextField *customBlueTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *customVCButton;
@property (strong, nonatomic)UIToolbar *accessoryView;
@property (strong, nonatomic)UITextField *activeTextField;
@end

@implementation JMSMainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Colors";
        self.tabBarItem.image = [UIImage imageNamed:@"ColorsTab"];
        
        _redVC = [[JMSRedViewController alloc] init];
        _greenVC = [[JMSGreenViewController alloc] init];
        _blueVC = [[JMSBlueViewController alloc] init];
        _customVC = [[JMSCustomViewController alloc] init];
        _randomVC = [[JMSRandomViewController alloc] init];
    }
    return self;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.customRedTextField.inputAccessoryView = self.accessoryView;
    self.customGreenTextField.inputAccessoryView = self.accessoryView;
    self.customBlueTextField.inputAccessoryView = self.accessoryView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Properties
- (UIToolbar *)accessoryView
{
    if (!_accessoryView) {
        _accessoryView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        _accessoryView.translucent = NO;
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                    target:self
                                                                                    action:@selector(keyboardDoneButton)];
        UIBarButtonItem *previousButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:105
                                                                                        target:self
                                                                                        action:@selector(selectPreviousTextField)];
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:106
                                                                                    target:self
                                                                                    action:@selector(selectNextTextField)];
        UIBarButtonItem *flexiSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                    target:nil
                                                                                    action:nil];
        UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
        fixedSpace.width = 10;
        _accessoryView.items = @[fixedSpace, previousButton, fixedSpace, nextButton, flexiSpace, doneButton];
    }
    return _accessoryView;
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
    if (self.customRedTextField.text.length == 0 || self.customGreenTextField.text.length == 0 || self.customBlueTextField.text.length == 0) {
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Missing Data"
                                                             message:@"All 3 custom values must be filled"
                                                            delegate:nil
                                                   cancelButtonTitle:nil
                                                   otherButtonTitles:@"Ok", nil];
        [errorAlert show];
        return;
    }
    
    CGFloat customRed = (CGFloat)([self.customRedTextField.text floatValue] / 100.0f);
    CGFloat customBlue = (CGFloat)([self.customBlueTextField.text floatValue] / 100.0f);
    CGFloat customGreen = (CGFloat)([self.customGreenTextField.text floatValue] / 100.0f);
    
    UIColor *customColor = [UIColor colorWithRed:customRed
                                           green:customGreen
                                            blue:customBlue
                                           alpha:1.0];
    [self.customVC changeBackgroundColorToColor:customColor];
    [self presentViewController:self.customVC animated:YES completion:nil];
}

- (IBAction)randomButton:(id)sender
{
    [self presentViewController:self.randomVC animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
    
    return YES;
}

#pragma mark - Keyboard Notifications
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if ( screenHeight == 568) { //returns if on a 4" display
        return;
    }
    
    self.scrollview.scrollEnabled = YES;
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    kbSize.height += self.accessoryView.bounds.size.height;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollview.contentInset = contentInsets;
    self.scrollview.scrollIndicatorInsets = contentInsets;

    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.customVCButton.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, aRect.size.height - 60);
        [self.scrollview setContentOffset:scrollPoint animated:YES];
    }
    
    self.scrollview.scrollEnabled = NO;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [self.scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
}

#pragma mark - Private
- (void)keyboardDoneButton
{
    [self.activeTextField resignFirstResponder];
}

- (void)selectPreviousTextField
{
    if (self.activeTextField == self.customRedTextField) {
        [self.customBlueTextField becomeFirstResponder];
    } else if (self.activeTextField == self.customGreenTextField) {
        [self.customRedTextField becomeFirstResponder];
    } else if (self.activeTextField == self.customBlueTextField) {
        [self.customGreenTextField becomeFirstResponder];
    }
}

- (void)selectNextTextField
{
    if (self.activeTextField == self.customRedTextField) {
        [self.customGreenTextField becomeFirstResponder];
    } else if (self.activeTextField == self.customGreenTextField) {
        [self.customBlueTextField becomeFirstResponder];
    } else if (self.activeTextField == self.customBlueTextField) {
        [self.customRedTextField becomeFirstResponder];
    }
}

@end
