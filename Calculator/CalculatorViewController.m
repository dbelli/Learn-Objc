//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Admin1 on 4/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

-(CalculatorBrain *)brain {
    
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

-(IBAction)digitPressed:(UIButton *)sender{
    NSString *digit = [[sender titleLabel]text];
    if (userIsInTheMiddleOfTypingANumber) {
        if ([digit isEqual:@"."]) {
            NSRange range = [[display text]rangeOfString:@"."];
            if (range.location == NSNotFound) {
                [display setText:[[display text] stringByAppendingString:digit]]; 
            }
        }else {
            [display setText:[[display text] stringByAppendingString:digit]]; 
        }
        
    }else
    {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES; 
    }
        
}
-(IBAction)operationPressed:(UIButton *)sender{
    if (userIsInTheMiddleOfTypingANumber) { 
        [[self brain] setOperand:[[display text] doubleValue]]; 
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain]performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g",result]];
    
}

@end
