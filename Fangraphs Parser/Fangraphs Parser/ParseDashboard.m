//
//  ParseDashboard.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/20/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseDashboard.h"
#import "StringManipulation.h"

@implementation ParseDashboard

- (void)main {
    [self mainBody:@"Dashboard" filledPlayerArray:([self getPlayer])];
}
-(NSArray *)getPlayer{
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow' or @class='rgRow grid_total']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow' or @class='rgRow grid_total']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *dashHitterXPath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow' or @class='rgRow grid_total']/td";
    NSArray *sharedNodes = [FGPlayerParser searchWithXPathQuery:dashHitterXPath];

    
    //Temp Vars for changing NSString to NSNumber
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];

    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = (21*i);
        
        Player *player = [[Player alloc] init];
        
        //Set Year
        
        player.year = [self getNodeString:yearNodes index:i loggingStatement:@"Year"];
        elementCount++;
        
        //Set Team
        if( [teamNodes count] > i ){
            player.team = [self getNodeString:teamNodes index:i loggingStatement:@"Team"];
        }
        elementCount++;

        //Set Games
        player.games = [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Games"];
        elementCount++;
        
        
        //Set Plate Appearences
        player.plateAppearences =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"PA"];
        elementCount++;
        
        //Set Homeruns
        player.homeruns =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"HR"];
        elementCount++;
        
        //Set Runs
        player.runs =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Runs"];
        elementCount++;

        //Set RBI
        player.rbi =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"RBI"];
        elementCount++;
        
        //Set SB
        player.stolenBases =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SB"];
        elementCount++;
        
        //BB%
        player.baseOnBallPercentage = [self getNodeStringWithoutPercentage:sharedNodes index:elementCount loggingStatement:@"K percentage"];
        elementCount++;

        
        //K%
        player.strikeoutPercentage = [self getNodeStringWithoutPercentage:sharedNodes index:elementCount loggingStatement:@"K percentage"];
        elementCount++;
        
        //ISO
        player.isolatedSlugging =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"ISO"];
        elementCount++;
        
        
        //BABIP
        player.babip =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"BABIP"];
        elementCount++;
        
        //Set AVG
        player.average =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Average"];
        elementCount++;
        
        //OBP
        player.onBasePercentage =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"OPB"];
        elementCount++;
        
        //SlG
        player.sluggingPercentage =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SLG"];
        elementCount++;
        
        //wOBA
        player.wOBA =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"wOBA"];
        elementCount++;
        
        player.wRCPlus =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"wrc+"];
        elementCount++;
        
        
        //Set Position
        player.baseRunning =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Base Running Value"];
        elementCount++;
        
        //Set Position
        player.offense =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Offensive Value"];
        elementCount++;
        
        //Set Position
        player.defense =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Defensive Value"];
        elementCount++;
        
        //Set Position
        player.winsAboveReplacement =[self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"WAR"];
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}
@end
