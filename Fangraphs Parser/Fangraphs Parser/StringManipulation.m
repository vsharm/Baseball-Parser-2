//
//  StringManipulation.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/2/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "StringManipulation.h"

@implementation StringManipulation

-(NSNumber  *)removePercentage:(NSString *)inputStr {
    NSNumber *retNumber = [[NSNumber alloc] initWithInt:0];
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    
    
    if ( [inputStr length] >= 2){
        if( [inputStr characterAtIndex: [inputStr length]-1] ==  41){
            inputStr = [inputStr substringToIndex:[inputStr length] - 8];
        }
        else if( [inputStr characterAtIndex: [inputStr length]-2] ==  0){
            inputStr = [inputStr substringToIndex:[inputStr length] - 2];
        }
        else{
            inputStr = [inputStr substringToIndex:[inputStr length] - 1];
        }
        retNumber = [temp numberFromString: inputStr];
    }
    return retNumber;
}

-(NSNumber *)removeDollarSign:(NSString *)inputStr{
    NSNumber *retNumber = [[NSNumber alloc] initWithInt:0];
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    if ( [inputStr length] >= 2){
        inputStr = [self removeParenthesis:inputStr];
        inputStr = [inputStr substringFromIndex:1];
        
    }
    retNumber = [temp numberFromString: inputStr];
    return retNumber;
}

-(NSString *)removeParenthesis:(NSString *)inputStr{
    if ( [inputStr length] >= 2){
        if([inputStr characterAtIndex:0] == '('){
            inputStr = [inputStr substringFromIndex:1];
            inputStr = [inputStr substringToIndex:[inputStr length] - 1];
        }
    }
    return inputStr;
}

@end
