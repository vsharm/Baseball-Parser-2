//
//  PlayerInfoAndPosition.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 7/29/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Player.h"

@interface PlayerInfoAndPosition : NSOperation{
    TFHpple *FGPlayerParser;
}


@property (nonatomic, copy) NSData *webpage;
@property (nonatomic, copy) NSArray *playerInfoData;


- (id)initWithWebpage:(NSData*)webpageData;
- (void)main;

@end
