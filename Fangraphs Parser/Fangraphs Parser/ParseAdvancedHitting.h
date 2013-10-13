//
//  ParseAdvancedHitting.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 9/16/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Player.h"

@interface ParseAdvancedHitting : NSOperation{
    TFHpple *FGPlayerParser;
}

@property (nonatomic, copy) NSData *webpage;
@property (nonatomic, copy) NSArray *advanced;


- (id)initWithWebpage:(NSData*)webpageData;
- (void)main;
@end
