//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Admin1 on 4/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
    double operand;
    double waitingOperand;
    NSString *waitingOperation;
}
-(void)setOperand:(double)aDouble;
-(double)performOperation:(NSString *)operation;
@end
