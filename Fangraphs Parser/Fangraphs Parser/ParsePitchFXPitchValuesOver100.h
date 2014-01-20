//
//  ParsePitchFXPitchValuesOver100.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/18/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Player.h"
@interface ParsePitchFXPitchValuesOver100 : NSOperation{
    TFHpple *FGPlayerParser;
}

@property (nonatomic, copy) NSData *webpage;
@property (nonatomic, copy) NSArray *pitchFXValuesOver100;


- (id)initWithWebpage:(NSData*)webpageData;
- (void)main;

@end
