//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Admin1 on 4/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

-(void)setOperand:(double)aDouble{
    operand = aDouble;
}

- (void)performWaitingOperation { 
    if ([@"+" isEqual:waitingOperation]) { 
        operand = waitingOperand + operand; 
    }else 
    if ([@"*" isEqual:waitingOperation]) { 
        operand = waitingOperand * operand; 
    }else 
    if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand; 
    }else 
    if ([@"/" isEqual:waitingOperation]) {
        if (operand) { 
            operand = waitingOperand / operand;
        }
    } 
}


-(double)performOperation:(NSString *)operation{
    if ([operation isEqual:@"Sqrt"]) {
        operand = sqrt(operand);
    }else 
    if ([operation isEqual:@"sine"]) {
        operand = sin(operand);
    }else
    if ([operation isEqual:@"cos"]) {
            operand = cos(operand);
    }else
    if ([@"+/-" isEqual:operation]) {
        operand = - operand;
    }else
    if ([@"1/x" isEqual:operation]) {
        if (operand) {
            operand = operand / (operand * operand);
        }
        
    }else
    {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}
@end
