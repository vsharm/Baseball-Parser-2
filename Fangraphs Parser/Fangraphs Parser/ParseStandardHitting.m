//
//  ParseStandardHitting.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 7/7/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "ParseStandardHitting.h"

@implementation ParseStandardHitting

- (void)main {
    [self mainBody:@"StandardHitting" filledPlayerArray:([self getPlayer]) ];
}


-(NSArray *)getPlayer{
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *stdHitterXPath = @"//*[@id='SeasonStats1_dgSeason1_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *sharedNodes = [FGPlayerParser searchWithXPathQuery:stdHitterXPath];
    
    //Temp Vars for changing NSString to NSNumber
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = (22*i);
        
        Player *player = [[Player alloc] init];
        
        //Set Year

        player.year = [self getNodeString:yearNodes index:i loggingStatement:@"Year"];
        elementCount++;
        
        //Set Team
        player.team = [self getNodeString:teamNodes index:i loggingStatement:@"Team"];
        elementCount++;
        
        //Set Games

        player.games = [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Games"];
        elementCount++;
        
        //Set At Bats
        player.atBats = [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"AB"];
        elementCount++;
        
        //Set Plate Appearences
        player.plateAppearences =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"PA"];
        elementCount++;
        
        //Set Hits
        player.hits =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"Hits"];
        elementCount++;
        
        //Set Singles
        player.singles = [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"1B"];
        elementCount++;
        
        //Set Doubles
        player.doubles =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"2B"];
        elementCount++;
        
        //Set Triples
        player.triples =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"3B"];
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
        
        //Set BB
        player.baseOnBalls =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"BB"];
        elementCount++;
        
        //Set IBB
        player.intentionalBaseOnBalls =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"IBB"];
        elementCount++;
        
        //Set so

        player.strikeouts =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SO"];
        elementCount++;
        
        //Set hbp
        player.hitByPitch =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"HBP"];
        elementCount++;
        
        //Set SF
        player.sacrificeFlys =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SF"];
        elementCount++;
        
        //Set SH
        player.sacrificeHits =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SH"];
        elementCount++;
        
        //Set GDP
        player.groundIntoDoublePlays =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"GDP"];
        elementCount++;
        
        //Set SB
        player.stolenBases =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SB"];
        elementCount++;
        
        //Set CS
        player.caughtStolen =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"SB"];
        elementCount++;
        
        //Set AVG
        player.average =  [self getNodeNumber:sharedNodes index:elementCount loggingStatement:@"AVG"];
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
