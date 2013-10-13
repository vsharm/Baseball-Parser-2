//http://feeds.arstechnica.com/~r/arstechnica/everything/~3/_4rs6wVf_04/
//  AppController.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 5/29/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate>
{
    IBOutlet NSTableView *tableViewSidebar;
    IBOutlet NSTableView *tableViewStandardHitting;
    IBOutlet NSTextField *name;
    IBOutlet NSTextField *positionField;

    
    NSMutableArray *tableNames;
    //NSTextField *result;
    NSMutableArray *titleTextFields;
    NSMutableArray *subTextFields;
    NSMutableArray *spinningWheels;
    NSArray *StandardHitting;
    NSArray *StandardPlayerInfo;
    
    int standardCounter;
    int playerInfoStats;

}

-(IBAction)button:(id)sender;

@end
