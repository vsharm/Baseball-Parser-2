//
//  DataViewCell.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 6/26/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "DataViewCell.h"

@implementation DataViewCell

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize wheel = _wheel;



- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
