//
//  ios_login_minViewController.h
//  ios_login_min
//
//  Created by Matthew Swann on 6/24/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ios_login_minViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *char_entry_field;

@property (weak, nonatomic) IBOutlet UITextView *display_field;

- (IBAction)char_entry_button_pressed:(UIButton *)sender;

- (IBAction)background_tap:(id)sender;

- (IBAction)text_field_done_editing:(id)sender;

- (NSString *) validate_input_char: function;

- (NSString *) validate_input_binary: function;

- (void) input_validation_error: message;

//- (NSString *) is_binary_type_function:function;

- (NSString *) initial_char_check: function;

- (bool) this_is_binary: function;

@end
