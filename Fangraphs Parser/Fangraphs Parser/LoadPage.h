//
//  LoadPage.h
//  Baseball Parser
//
//  Created by Varun Sharma on 1/5/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadPage : NSOperation

@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSData *webpage;


- (id)initWithURL:(NSURL*)url;
- (void)main;

@end
