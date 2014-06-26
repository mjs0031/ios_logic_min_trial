//
//  ios_login_minViewController.m
//  ios_login_min
//
//  Created by Matthew Swann on 6/24/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//
//
//
//
//  Major steps needed ::
//      1) normalization function
//      2) tab view exploration
//      3) minimizer
//      4) how to pass variables to other views
//      5) vizualization

//    Keep below 100 MB

#import "ios_login_minViewController.h"

@interface ios_login_minViewController ()

@end

@implementation ios_login_minViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 
 */
- (IBAction)background_tap:(id)sender {
    
    [self.char_entry_field resignFirstResponder];
}


/**
 
 */
- (IBAction)text_field_done_editing:(id)sender{
    [self resignFirstResponder];
}


- (IBAction)char_entry_button_pressed:(UIButton *)sender {
    
    
    // needs -->
    
    // 1) resign keyboard if active
    // 2) validate char/binary
    // 3) if char, nomalize (may need global function variable)
    // 4) minimize
    [self.char_entry_field resignFirstResponder];
    
    NSString *function = self.char_entry_field.text;
    
    
    // make global
    NSString *message = @"";
    
    NSString *temp = @"";
    
    
    // not needed, the length can be checked to equal zero
    NSString * const control = @"";
    
    if ( ![control length] == 0 ) {
        message = @"bad";
    }
    
    temp = [self initial_char_check:function];
    
    if (message == control) { //1
        message = temp;
    }// 1
    
    //if ( [self this_is_binary:function] == true ) { // 2
    
        //temp = [self validate_input_binary: function];
        
        //if (message == control) { // 3
        //    message = temp;
        //} // 3
        
   // } // 2
    
    //else { // 4
    
        temp = [self validate_input_char: function];
    
        if (message == control) { // 5
            message = temp;
        } //5
    //} // 4
    
    if ( message != control ) {
    
        [self input_validation_error:message];
    }
    else {
    
        self.display_field.text = function;
    }

    
} // end char_entry_button_pressed


/**
 */
- (NSString *) initial_char_check: (NSString *)function {
    
    //bool output = false;
    NSString *message = @"";
    char chara = '~';
    
    //NSCharacterSet *invetered_valids = [[NSCharacterSet characterSetWithCharactersInString:@"aAbBcCdD+'"] invertedSet];
    
    if ( [function length] > 0 ) {
    
        if ( [function characterAtIndex:0] == 'A' ||
            [function characterAtIndex:0] == 'B' ||
            [function characterAtIndex:0] == 'C' ||
            [function characterAtIndex:0] == 'D'        ) {
            
            chara = [function characterAtIndex:0];
    
            //output = false;
        }
        else if ([function characterAtIndex:0] == '1' ||
                 [function characterAtIndex:0] == '0'    ) {
    
            chara = [function characterAtIndex:0];
            //output = true;
        }
    
        else {
        
            message = @"Invalid Charater"\
            "\nFirst character must be"\
            "\na character : A, B, C, D"\
            "\nor a number : 1, 0";
        
            //[self input_validation_error:  @"Invalid Charater"\
                                        "\nFirst character must be"\
                                        "\na character : A, B, C, D"\
                                        "\nor a number : 1, 0"];
        
        }
    
    }
    else {
        
        message = @"no input";
    }
    
    return message;
} // end is_binary_type_function


/**
 Returns true if the function is binary; false otherwise.
 
 @param function : Pared function for minimization
 
 @return boolean : True if the function is binary; false otherwise.
 */
- (bool) this_is_binary: (NSString *)function {

    bool output = false;
    
    if ( [function characterAtIndex:0] == '1' ||
        [function characterAtIndex:0 == '0'] ) {
        
        output = true;
    }
    
    return output;
} // end is_binary




/**
 Input validation for character based function.
 
 @param function : String represented function using char's and '+'
 */
- (NSString *) validate_input_char: (NSString *)function {
    
    //bool output = true;
    
    NSString *message = @"";
    
    NSCharacterSet *inverted_chars = [[NSCharacterSet characterSetWithCharactersInString:@"aAbBcCdD+' "] invertedSet];
    
    NSRange tripped = [function rangeOfCharacterFromSet:inverted_chars];
    
    if (tripped.location != NSNotFound) {
        
        message = @"Alpha Char Set Invalid"\
        "\nMay only contain the following ::"\
        "\na A b B c C d D + '"\
        "\n"\
        "Example: A'BC+BC'+AC";
        
        //[self input_validation_error:  @"Alpha Char Set Invalid"\
                                        "\nMay only contain the following ::"\
                                        "\na A b B c C d D + '"\
                                        "\n"\
                                        "Example: A'BC+BC'+AC"];
    
        //output = false;
    } // end error generation
    
    return message;
    
} // end validate_input_char


/**
 Input validation for binary based function.
 
 @param function : String represented function using '1', '0' and '+'
 */
- (NSString *) validate_input_binary: (NSString *)function {

    NSString *message = @"";
    
    NSCharacterSet *inverted_binary = [[NSCharacterSet characterSetWithCharactersInString:@"10+"] invertedSet];
    
    NSRange tripped = [function rangeOfCharacterFromSet:inverted_binary];
    
    if (tripped.location != NSNotFound) {
        
        message = @"binary Char Set Invalid"\
        "\nMay only contain the following ::"\
        "\n1, 0, +"\
        "\n"\
        "\nExample: 101+001+010";
        
        //[self input_validation_error:  @"Alpha Char Set Invalid"\
                                        "\nMay only contain the following ::"\
                                        "\n1, 0, +"\
                                        "\n"\
                                        "\nExample: 101+001+010"];
    } // end error generation
    
    return message;
    
} // end validate_input_binary


/**
 Generates a validation error message.
 
 @param message : Pre-formatted message as an NSString.
 */
- (void) input_validation_error: (NSString *)message {
    
    UIAlertView *alert = [[UIAlertView  alloc]
                          initWithTitle     :@"Validation Error"
                          message           :message
                          delegate          :nil
                          cancelButtonTitle :@"okay"
                          otherButtonTitles :nil];
    
    [alert show];
    
    //UIAlertView *Alert = [NSClassFromString(@"_UIAlertManager") performSelector:@selector(Alert)];
    
    //Class UIAlertManager = objc_getClass("_UIAlertManager");
    //UIAlertView *Alert = [UIAlertManager performSelector:@selector(Alert)];
    
    //if (Alert != nil) {
    //    [alert show];
    //}
    
} // end input_validation_error


-(NSString *) normalize: (NSString *)function {

    NSString *output = @"";
    
    
    return output;
}


@end
