//
//  ParseDashboard.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/20/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Player.h"

@interface ParseDashboard : NSOperation{
    TFHpple *FGPlayerParser;
}

@property (nonatomic, copy) NSData *webpage;
@property (nonatomic, copy) NSArray *dashboard;


- (id)initWithWebpage:(NSData*)webpageData;
- (void)main;

@end
