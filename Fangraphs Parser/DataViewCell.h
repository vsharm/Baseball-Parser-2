//
//  DataViewCell.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 6/26/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DataViewCell : NSTableCellView{
@private
    NSTextField *_title;
    NSTextField *_subtitle;
    NSProgressIndicator *_wheel;
    
}

@property(retain) IBOutlet NSTextField *title;
@property(retain) IBOutlet NSTextField *subtitle;
@property(retain) IBOutlet NSProgressIndicator *wheel;


@end
