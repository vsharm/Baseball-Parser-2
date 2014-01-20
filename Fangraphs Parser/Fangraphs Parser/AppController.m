//
//  AppController.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 5/29/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "AppController.h"
#import "MasterParser.h"
#import "DataViewCell.h"
#import "Player.h"
@implementation AppController

- (id)init{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(eventListenerDidReceiveNotification:)
                                                 name:@"StandardHitting"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(eventListenerDidReceiveNotification:)
                                                 name:@"PlayerInfoStats"
                                               object:nil];
    standardCounter = 0;
    playerInfoStats = 0;
    return self;
}

- (void)eventListenerDidReceiveNotification:(NSNotification *)notif
{
    if ([[notif name] isEqualToString:@"StandardHitting"] && (standardCounter == 0))
    {
        standardCounter++;
        NSLog(@"Standard Hitting Notification");
        NSDictionary *standard = [notif userInfo];
        StandardHitting = [[NSArray alloc] initWithArray:[standard objectForKey:@"StandardHitting"]];
        [tableViewStandardHitting reloadData];
    }
    else if([[notif name] isEqualToString:@"PlayerInfoStats"] && (playerInfoStats == 0)){
        playerInfoStats++;
        NSLog(@"PlayerInfoStats Notification");
        NSDictionary *standard = [notif userInfo];
        StandardPlayerInfo = [[NSArray alloc] initWithArray:[standard objectForKey:@"PlayerInfoStats"]];
        [name setStringValue:[[StandardPlayerInfo objectAtIndex:0] name]];
        [positionField setStringValue:[[StandardPlayerInfo objectAtIndex:0] playerPosition]];
    }
}



-(IBAction)button:(id)sender
{
    
	MasterParser *parser = [[MasterParser alloc] init];
    [parser setURL:@"Buster Posey"];
    [parser setWebPages];
    if([parser isDuplicate]){
        NSLog(@"TRUE");
        [parser getDuplicateLinks];
    }
    //[parser getNumYears];
    //[parser getPlayer];
    
    
    tableNames = [NSMutableArray new];
    [tableNames addObject:@"Standard"];
//    [tableNames addObject:@"Advanced"];
    [tableViewSidebar reloadData];
    [parser getAllPlayerCatagories];

}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"NumberofRowsInTableView: %@",[tableView identifier]);
    NSString *identifier =[tableView identifier];
    if( [identifier isEqualToString:@"Sidebar"] )
        return [tableNames count];
    else if( [identifier isEqualToString:@"StandardHitting"] )
        return [StandardHitting count];
    return 0;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSLog(@"View: %@",[tableView identifier]);
    NSLog(@"Column: %@",[tableColumn identifier]);
    NSString *identifier =[tableColumn identifier];
    if( [identifier isEqualToString:@"SidebarColumn"] ){
        return [tableNames objectAtIndex:row];
    }
    else if( [[tableView identifier] isEqualToString:@"StandardHitting"] ){
        Player *player = [StandardHitting objectAtIndex:row];
        return [player valueForKey:identifier];
    }
    return nil;
}




-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    //NSString *identifier = [tableColumn identifier];
    DataViewCell *view = [tableView makeViewWithIdentifier:@"SidebarColumn" owner:self];
    if(row == 0){
        view.title.stringValue = @"Standard";
        view.subtitle.stringValue = @"G, AB, PA, H, 1B, 2B, 3B, HR, R, RBI, BB, IBB, SO, HBP, SF, SH, GDP, SB, CS, AVG";
    }

    [view setNeedsDisplay:YES];
    return view;
    
}



@end
