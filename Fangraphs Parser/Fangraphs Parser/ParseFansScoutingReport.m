//
//  ParseValue.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/19/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseFansScoutingReport.h"

@implementation ParseFansScoutingReport
@synthesize webpage;
@synthesize fanScoutingReport;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    fanScoutingReport = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:fanScoutingReport
                                                                forKey:@"FanScoutingReport"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FanScoutingReport" object:nil userInfo:orientationData];
    });
}




//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN pitchFXPitchType");
    
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason14_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason14_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *fanScoutingXPath = @"//*[@id='SeasonStats1_dgSeason14_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *fanScoutingNodes = [FGPlayerParser searchWithXPathQuery:fanScoutingXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    //*[@id="SeasonStats1_dgSeason16_ctl00"]
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((13)*i);
        
        Player *player = [[Player alloc] init];
        
        NSLog(@"element Count: %d",elementCount);
        
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
        
        TFHppleElement *inningsElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *innings = [temp numberFromString:[[inningsElement firstChild]content]];
        player.innings = innings;
        NSLog(@"Innings: %@",player.innings);
        elementCount++;

        
        TFHppleElement *votesElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *votes = [temp numberFromString:[[votesElement firstChild]content]];
        player.votes = votes;
        NSLog(@"Votes: %@",player.votes);
        elementCount++;
        
        
        TFHppleElement *instinctsElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *instincts = [temp numberFromString:[[instinctsElement firstChild]content]];
        player.instincts = instincts;
        NSLog(@"Instincts: %@",player.instincts);
        elementCount++;
        
        
        TFHppleElement *firstStepElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *firstStep = [temp numberFromString:[[firstStepElement firstChild]content]];
        player.firstStep = firstStep;
        NSLog(@"First Step: %@",player.firstStep);
        elementCount++;
        
        
        TFHppleElement *fanSpeedElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *fanSpeed = [temp numberFromString:[[fanSpeedElement firstChild]content]];
        player.fanSpeed = fanSpeed;
        NSLog(@"Speed: %@",player.fanSpeed);
        elementCount++;
        
        
        TFHppleElement *handsElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *hands = [temp numberFromString:[[handsElement firstChild]content]];
        player.hands = hands;
        NSLog(@"Hands: %@",player.hands);
        elementCount++;
        
        
        TFHppleElement *fanReleaseElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *fanRelease = [temp numberFromString:[[fanReleaseElement firstChild]content]];
        player.fanRelease = fanRelease;
        NSLog(@"Release: %@",player.fanRelease);
        elementCount++;
        
        
        TFHppleElement *armStrengthElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *armStrength = [temp numberFromString:[[armStrengthElement firstChild]content]];
        player.armStrength = armStrength;
        NSLog(@"Arm Strength: %@",player.armStrength);
        elementCount++;
        
        
        TFHppleElement *armAccuracyElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *armAccuracy = [temp numberFromString:[[armAccuracyElement firstChild]content]];
        player.armAccuracy = armAccuracy;
        NSLog(@"Arm Accuracy: %@",player.armAccuracy);
        elementCount++;
        
        
        TFHppleElement *overallElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *overall = [temp numberFromString:[[overallElement firstChild]content]];
        player.overall = overall;
        NSLog(@"Overall: %@",player.overall);
        elementCount++;
        
        
        TFHppleElement *fansScoutingReportRunsAboveAvgElement = [fanScoutingNodes objectAtIndex:elementCount];
        NSNumber *fansScoutingReportRunsAboveAvg = [temp numberFromString:[[fansScoutingReportRunsAboveAvgElement firstChild]content]];
        player.fansScoutingReportRunsAboveAvg = fansScoutingReportRunsAboveAvg;
        NSLog(@"FSR: %@",player.fansScoutingReportRunsAboveAvg);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end
