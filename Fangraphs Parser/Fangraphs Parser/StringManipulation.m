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
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    if ( [inputStr length] > 0)
        inputStr = [inputStr substringToIndex:[inputStr length] - 2];
    NSNumber *retNumber = [temp numberFromString: inputStr];
    return retNumber;
}

@end
