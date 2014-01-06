//
//  ParseMoreBattedBall.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/4/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Player.h"

@interface ParseMoreBattedBall : NSOperation{
    TFHpple *FGPlayerParser;
}

@property (nonatomic, copy) NSData *webpage;
@property (nonatomic, copy) NSArray *moreBattedBall;


- (id)initWithWebpage:(NSData*)webpageData;
- (void)main;
@end