//
//  ParseAdvancedFielding.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/12/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseAdvancedFielding.h"

@implementation ParseAdvancedFielding
@synthesize webpage;
@synthesize advancedFielding;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    advancedFielding = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:advancedFielding
                                                                forKey:@"AdvancedFielding"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AdvancedFielding" object:nil userInfo:orientationData];
    });
}


-(NSArray *)getPlayer{
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason12_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason12_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *advancedFieldingXPath = @"//*[@id='SeasonStats1_dgSeason12_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *advancedFieldingNodes = [FGPlayerParser searchWithXPathQuery:advancedFieldingXPath];
    
    NSString *positionNodesXPath = @"//*[@id='SeasonStats1_dgSeason12_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[3]/a";
    NSArray *positionNodes = [FGPlayerParser searchWithXPathQuery:positionNodesXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = (24*i);
        
        Player *player = [[Player alloc] init];
        
        //Set Year
        TFHppleElement *yearElement = [yearNodes objectAtIndex:i];
        NSString *year = [[yearElement firstChild]content];
        player.year = year;
        NSLog(@"Year: %@",player.year);
        elementCount++;
        
        //Set Team
        TFHppleElement *teamElement = [teamNodes objectAtIndex:i];
        NSString *team = [[teamElement firstChild]content];
        player.team = team;
        NSLog(@"Team: %@",player.team);
        elementCount++;
        
        //Set Position
        TFHppleElement *playerPositionElement = [positionNodes objectAtIndex:i];
        NSString *playerPosition = [[playerPositionElement firstChild]content];
        player.playerPosition = playerPosition;
        NSLog(@"Position: %@",player.playerPosition);
        elementCount++;
        
        //Set Games
        TFHppleElement *fieldingInningsElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *fieldingInnings = [temp numberFromString:[[fieldingInningsElement firstChild]content]];
        player.fieldingInnings = fieldingInnings;
        NSLog(@"Fielding Innings: %@",player.fieldingInnings);
        elementCount++;
        
        //Set At Bats
        TFHppleElement *stolenBaseRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *stolenBaseRunsAboveAvg = [temp numberFromString:[[stolenBaseRunsAboveAvgElement firstChild]content]];
        player.stolenBaseRunsAboveAvg = stolenBaseRunsAboveAvg;
        NSLog(@"Runs Saved Stolen Bases FB: %@",player.stolenBaseRunsAboveAvg);
        elementCount++;
        
        
        TFHppleElement *doublePaysRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *doublePaysRunsAboveAvg = [temp numberFromString:[[doublePaysRunsAboveAvgElement firstChild]content]];
        player.doublePaysRunsAboveAvg = doublePaysRunsAboveAvg;
        NSLog(@"Runs Saved Double Plays FB: %@",player.doublePaysRunsAboveAvg);
        elementCount++;
        
        
        TFHppleElement *armRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *armRunsAboveAvg = [temp numberFromString:[[armRunsAboveAvgElement firstChild]content]];
        player.armRunsAboveAvg = armRunsAboveAvg;
        NSLog(@"Runs Saved Arm FB: %@",player.armRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *goodFieldingPlaysRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *goodFieldingPlaysRunsAboveAvg = [temp numberFromString:[[goodFieldingPlaysRunsAboveAvgElement firstChild]content]];
        player.goodFieldingPlaysRunsAboveAvg = goodFieldingPlaysRunsAboveAvg;
        NSLog(@"Good Fielding Plays FB: %@",player.goodFieldingPlaysRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *plusMinusRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *plusMinusRunsAboveAvg = [temp numberFromString:[[plusMinusRunsAboveAvgElement firstChild]content]];
        player.plusMinusRunsAboveAvg = plusMinusRunsAboveAvg;
        NSLog(@"Runs Saved Plus Minus FB: %@",player.plusMinusRunsAboveAvg);
        elementCount++;
        
        
        TFHppleElement *defensiveRunsSavedElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *defensiveRunsSaved = [temp numberFromString:[[defensiveRunsSavedElement firstChild]content]];
        player.defensiveRunsSaved = defensiveRunsSaved;
        NSLog(@"Defensive Runs Saved: %@",player.defensiveRunsSaved);
        elementCount++;
        
        
        TFHppleElement *ballsInZoneElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *ballsInZone = [temp numberFromString:[[ballsInZoneElement firstChild]content]];
        player.ballsInZone = ballsInZone;
        NSLog(@"Balls in Zone: %@",player.ballsInZone);
        elementCount++;
        
        TFHppleElement *totalPlaysMadeElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *totalPlaysMade = [temp numberFromString:[[totalPlaysMadeElement firstChild]content]];
        player.totalPlaysMade = totalPlaysMade;
        NSLog(@"Total Plays Made: %@",player.totalPlaysMade);
        elementCount++;
        
        TFHppleElement *revisedZoneRatingElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *revisedZoneRating = [temp numberFromString:[[revisedZoneRatingElement firstChild]content]];
        player.revisedZoneRating = revisedZoneRating;
        NSLog(@"Revised Zone Rating: %@",player.revisedZoneRating);
        elementCount++;
        
        TFHppleElement *outOfZonePlaysElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *outOfZonePlays = [temp numberFromString:[[outOfZonePlaysElement firstChild]content]];
        player.outOfZonePlays = outOfZonePlays;
        NSLog(@"Plays Made Outside Zone: %@",player.outOfZonePlays);
        elementCount++;
        
        TFHppleElement *expectedCatcherPassedPitchesElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *expectedCatcherPassedPitches = [temp numberFromString:[[expectedCatcherPassedPitchesElement firstChild]content]];
        player.expectedCatcherPassedPitches = expectedCatcherPassedPitches;
        NSLog(@"Expected Catcher Passed Balls: %@",player.expectedCatcherPassedPitches);
        elementCount++;
        
        TFHppleElement *blockedPitchesRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *blockedPitchesRunsAboveAvg = [temp numberFromString:[[blockedPitchesRunsAboveAvgElement firstChild]content]];
        player.blockedPitchesRunsAboveAvg = blockedPitchesRunsAboveAvg;
        NSLog(@"Catcher Blocked Pitches Runs Above Avg: %@",player.blockedPitchesRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *totalZoneLocationDataElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *totalZoneLocationData = [temp numberFromString:[[totalZoneLocationDataElement firstChild]content]];
        player.totalZoneLocationData = totalZoneLocationData;
        NSLog(@"Total Zone Runs Above Avg: %@",player.totalZoneLocationData);
        elementCount++;
        
        TFHppleElement *fansScoutingReportRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *fansScoutingReportRunsAboveAvg = [temp numberFromString:[[fansScoutingReportRunsAboveAvgElement firstChild]content]];
        player.fansScoutingReportRunsAboveAvg = fansScoutingReportRunsAboveAvg;
        NSLog(@"Fans Scouting Report Runs Above Avg: %@",player.fansScoutingReportRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *uzrArmRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *uzrArmRunsAboveAvg = [temp numberFromString:[[uzrArmRunsAboveAvgElement firstChild]content]];
        player.uzrArmRunsAboveAvg = uzrArmRunsAboveAvg;
        NSLog(@"Arm UZR: %@",player.uzrArmRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *uzrDoublePlayRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *uzrDoublePlayRunsAboveAvg = [temp numberFromString:[[uzrDoublePlayRunsAboveAvgElement firstChild]content]];
        player.uzrDoublePlayRunsAboveAvg = uzrDoublePlayRunsAboveAvg;
        NSLog(@"Double Play UZR: %@",player.uzrDoublePlayRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *uzrRangeRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *uzrRangeRunsAboveAvg = [temp numberFromString:[[uzrRangeRunsAboveAvgElement firstChild]content]];
        player.uzrRangeRunsAboveAvg = uzrRangeRunsAboveAvg;
        NSLog(@"Range UZR: %@",player.uzrRangeRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *uzrErrorRunsAboveAvgElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *uzrErrorRunsAboveAvg = [temp numberFromString:[[uzrErrorRunsAboveAvgElement firstChild]content]];
        player.uzrErrorRunsAboveAvg = uzrErrorRunsAboveAvg;
        NSLog(@"Error UZR: %@",player.uzrErrorRunsAboveAvg);
        elementCount++;
        
        TFHppleElement *uzrElement = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *uzr = [temp numberFromString:[[uzrElement firstChild]content]];
        player.uzr = uzr;
        NSLog(@"UZR: %@",player.uzr);
        elementCount++;
        
        TFHppleElement *uzrOver150Element = [advancedFieldingNodes objectAtIndex:elementCount];
        NSNumber *uzrOver150 = [temp numberFromString:[[uzrOver150Element firstChild]content]];
        player.uzrOver150 = uzrOver150;
        NSLog(@"UZR/150: %@",player.uzrOver150);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end