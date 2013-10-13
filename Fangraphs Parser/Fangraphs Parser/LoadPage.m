//
//  LoadPage.m
//  Baseball Parser
//
//  Created by Varun Sharma on 1/5/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "LoadPage.h"

@implementation LoadPage
@synthesize URL;
@synthesize webpage;


- (id)initWithURL:(NSURL*)url{
    self = [super init];
    [self setURL:url];
    return self;
}
- (void)main {
    NSData *page = [NSData dataWithContentsOfURL:URL];
    [self setWebpage:page];
}


@end
