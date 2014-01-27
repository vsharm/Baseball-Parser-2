//
//  ParserParent.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/26/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "TFHpple.h"

@interface ParserParent : NSOperation{
    TFHpple *FGPlayerParser;
}

- (void)mainBody:(NSString*)notificationkey filledPlayerArray:(NSArray *)data;
- (id)initWithWebpage:(NSData*)webpageData;
- (NSNumber *)getNodeNumber: (NSArray *)node index:(int)elementCount;
- (NSString *)getNodeString: (NSArray *)node index:(int)elementCount;

@property (nonatomic, copy) NSData *webpage;

@end
