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
@synthesize webpage;
@synthesize dashboard;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    dashboard = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:dashboard
                                                                forKey:@"Dashboard"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Dashboard" object:nil userInfo:orientationData];
    });
}


-(NSArray *)getPlayer{
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *dashHitterXPath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *dashHitterNodes = [FGPlayerParser searchWithXPathQuery:dashHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    StringManipulation *strMan = [[StringManipulation alloc] init];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = (21*i);
        
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
        
        //Set Games
        TFHppleElement *gamesElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *games = [temp numberFromString:[[gamesElement firstChild]content]];
        player.games = games;
        NSLog(@"Games: %@",player.games);
        elementCount++;
        
        //Set Plate Appearences
        TFHppleElement *paElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *pa = [temp numberFromString:[[paElement firstChild]content]];
        player.plateAppearences = pa;
        NSLog(@"PA: %@",player.plateAppearences);
        elementCount++;
        
        //Set Homeruns
        TFHppleElement *hrElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *hr = [temp numberFromString:[[hrElement firstChild]content]];
        player.homeruns = hr;
        NSLog(@"HR: %@",player.homeruns);
        elementCount++;
        
        //Set Runs
        TFHppleElement *runsElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *runs = [temp numberFromString:[[runsElement firstChild]content]];
        player.runs = runs;
        NSLog(@"Runs: %@",player.runs);
        elementCount++;
        
        //Set RBI
        TFHppleElement *rbiElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *rbi = [temp numberFromString:[[rbiElement firstChild]content]];
        player.rbi = rbi;
        NSLog(@"RBI: %@",player.rbi);
        elementCount++;
        
        //Set SB
        TFHppleElement *sbElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *sb = [temp numberFromString:[[sbElement firstChild]content]];
        player.stolenBases = sb;
        NSLog(@"SB: %@",player.stolenBases);
        elementCount++;
        
        
        TFHppleElement *bbPercentageElement = [dashHitterNodes objectAtIndex:elementCount];
        NSString *bbPercentageString =  [[bbPercentageElement firstChild]content];
        player.baseOnBallPercentage = [strMan removePercentage:bbPercentageString];
        NSLog(@"BB percentage: %@",player.baseOnBallPercentage);
        elementCount++;
        
        TFHppleElement *soPercentageElement = [dashHitterNodes objectAtIndex:elementCount];
        NSString *soPercentageString =  [[soPercentageElement firstChild]content];
        player.strikeoutPercentage = [strMan removePercentage:soPercentageString];;
        NSLog(@"K percentage: %@",player.strikeoutPercentage);
        elementCount++;
        
        TFHppleElement *isolatedSluggingElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *isolatedSlugging = [temp numberFromString:[[isolatedSluggingElement firstChild]content]];
        player.isolatedSlugging = isolatedSlugging;
        NSLog(@"ISO: %@",player.isolatedSlugging);
        elementCount++;
        
        TFHppleElement *babipElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *babip = [temp numberFromString:[[babipElement firstChild]content]];
        player.babip = babip;
        NSLog(@"BABIP: %@",player.babip);
        elementCount++;
        
        //Set AVG
        TFHppleElement *avgElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *avg = [temp numberFromString:[[avgElement firstChild]content]];
        player.average = avg;
        NSLog(@"AVG: %@",player.average);
        elementCount++;
        
        TFHppleElement *onBasePercentageElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *onBasePercentage = [temp numberFromString:[[onBasePercentageElement firstChild]content]];
        player.onBasePercentage = onBasePercentage;
        NSLog(@"OBP: %@",player.onBasePercentage);
        elementCount++;
        
        TFHppleElement *sluggingPercentageElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *sluggingPercentage = [temp numberFromString:[[sluggingPercentageElement firstChild]content]];
        player.sluggingPercentage = sluggingPercentage;
        NSLog(@"SLG: %@",player.sluggingPercentage);
        elementCount++;
        
        TFHppleElement *shElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *sh = [temp numberFromString:[[shElement firstChild]content]];
        player.wOBA = sh;
        NSLog(@"wOBA: %@",player.wOBA);
        elementCount++;
        
        TFHppleElement *wRCPlusElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *wRCPlus = [temp numberFromString:[[wRCPlusElement firstChild]content]];
        player.wRCPlus = wRCPlus;
        NSLog(@"wRC+: %@",player.wRCPlus);
        elementCount++;
        
        
        //Set Position
        TFHppleElement *baseRunningElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *baseRunning = [temp numberFromString:[[baseRunningElement firstChild]content]];
        player.baseRunning = baseRunning;
        NSLog(@"Base Running Value: %@",player.baseRunning);
        elementCount++;
        
        //Set Position
        TFHppleElement *offenseElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *offense = [temp numberFromString:[[offenseElement firstChild]content]];
        player.offense = offense;
        NSLog(@"Offense Value: %@",player.offense);
        elementCount++;
        
        //Set Position
        TFHppleElement *defenseElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *defense = [temp numberFromString:[[defenseElement firstChild]content]];
        player.defense = defense;
        NSLog(@"Defense Value: %@",player.defense);
        elementCount++;
        
        //Set Position
        TFHppleElement *winsAboveReplacementElement = [dashHitterNodes objectAtIndex:elementCount];
        NSNumber *winsAboveReplacement = [temp numberFromString:[[winsAboveReplacementElement firstChild]content]];
        player.winsAboveReplacement = winsAboveReplacement;
        NSLog(@"WAR: %@",player.winsAboveReplacement);
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}
@end
