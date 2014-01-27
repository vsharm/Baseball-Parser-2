//
//  ParserParent.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/26/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParserParent.h"

@implementation ParserParent
@synthesize webpage;


- (void)mainBody:(NSString*)notificationkey filledPlayerArray:(NSArray *)data{
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:data
                                                                forKey:notificationkey];

    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationkey object:nil userInfo:orientationData];
    });

}



- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    return self;
}


- (NSNumber *)getNodeNumber: (NSArray *)node index:(int)elementCount{
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    TFHppleElement *gamesElement = [node objectAtIndex:elementCount];
    return [temp numberFromString:[[gamesElement firstChild]content]];
}

- (NSString *)getNodeString: (NSArray *)node index:(int)elementCount{
    TFHppleElement *teamElement = [node objectAtIndex:elementCount];
    return [[teamElement firstChild]content];
}

@end
