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

        player.year = [self getNodeString:yearNodes index:i];
        NSLog(@"Year: %@",player.year);
        elementCount++;
        
        //Set Team
        player.team = [self getNodeString:teamNodes index:i];
        NSLog(@"Team: %@",player.team);
        elementCount++;
        
        //Set Games

        player.games = [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"Games: %@",player.games);
        elementCount++;
        
        //Set At Bats
        player.atBats = [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"AB: %@",player.atBats);
        elementCount++;
        
        //Set Plate Appearences
        player.plateAppearences =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"PA: %@",player.plateAppearences);
        elementCount++;
        
        //Set Hits
        NSNumber *hit =  [self getNodeNumber:sharedNodes index:elementCount];
        player.hits = hit;
        NSLog(@"Hits: %@",player.hits);
        elementCount++;
        
        //Set Singles
        player.singles = [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"1B: %@",player.singles);
        elementCount++;
        
        //Set Doubles
        player.doubles =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"2B: %@",player.doubles);
        elementCount++;
        
        //Set Triples
        player.triples =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"3B: %@",player.triples);
        elementCount++;
        
        //Set Homeruns
        player.homeruns =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"HR: %@",player.homeruns);
        elementCount++;
        
        //Set Runs
        player.runs =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"Runs: %@",player.runs);
        elementCount++;
        
        //Set RBI
        player.rbi =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"RBI: %@",player.rbi);
        elementCount++;
        
        //Set BB
        player.baseOnBalls =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"BB: %@",player.baseOnBalls);
        elementCount++;
        
        //Set IBB
        player.intentionalBaseOnBalls =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"IBB: %@",player.intentionalBaseOnBalls);
        elementCount++;
        
        //Set so

        player.strikeouts =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"SO: %@",player.strikeouts);
        elementCount++;
        
        //Set hbp
        player.hitByPitch =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"HBP: %@",player.hitByPitch);
        elementCount++;
        
        //Set SF
        player.sacrificeFlys =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"SF: %@",player.sacrificeFlys);
        elementCount++;
        
        //Set SH
        player.sacrificeHits =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"SH: %@",player.sacrificeHits);
        elementCount++;
        
        //Set GDP
        player.groundIntoDoublePlays =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"GDP: %@",player.groundIntoDoublePlays);
        elementCount++;
        
        //Set SB
        player.stolenBases =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"SB: %@",player.stolenBases);
        elementCount++;
        
        //Set CS
        player.caughtStolen =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"SB: %@",player.caughtStolen);
        elementCount++;
        
        //Set AVG
        player.average =  [self getNodeNumber:sharedNodes index:elementCount];
        NSLog(@"AVG: %@",player.average);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
