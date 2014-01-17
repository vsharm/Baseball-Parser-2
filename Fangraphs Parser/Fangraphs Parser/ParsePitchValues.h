//
//  ParsePitchValues.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/16/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Player.h"

@interface ParsePitchValues : NSOperation{
    TFHpple *FGPlayerParser;
}

@property (nonatomic, copy) NSData *webpage;
@property (nonatomic, copy) NSArray *pitchValues;


- (id)initWithWebpage:(NSData*)webpageData;
- (void)main;

@end
