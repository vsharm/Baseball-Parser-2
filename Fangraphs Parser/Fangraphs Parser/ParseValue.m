//
//  ParseValue.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/19/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseValue.h"
#import "StringManipulation.h"

@implementation ParseValue
@synthesize webpage;
@synthesize value;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    value = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:value
                                                                forKey:@"Value"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Value" object:nil userInfo:orientationData];
    });
}


-(NSArray *)getPlayer{
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason9_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason9_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *valueXPath = @"//*[@id='SeasonStats1_dgSeason9_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *valueNodes = [FGPlayerParser searchWithXPathQuery:valueXPath];
    

    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    StringManipulation *strMan = [[StringManipulation alloc] init];

    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i < [yearNodes count]; i++){
        int elementCount = (14*i);
        
        Player *player = [[Player alloc] init];
        
        //Set Year
        TFHppleElement *yearElement = [yearNodes objectAtIndex:i];
        NSString *year = [[yearElement firstChild]content];
        player.year = year;
        NSLog(@"Year: %@",player.year);
        elementCount++;
        
        if( [teamNodes count] < i){
        //Set Team
        TFHppleElement *teamElement = [teamNodes objectAtIndex:i];
        NSString *team = [[teamElement firstChild]content];
        player.team = team;
        NSLog(@"Team: %@",player.team);
        elementCount++;
        }
        
        //Set Position
        TFHppleElement *battingElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *batting = [temp numberFromString:[[battingElement firstChild]content]];
        player.batting = batting;
        NSLog(@"Batting Value: %@",player.batting);
        elementCount++;
        
        //Set Position
        TFHppleElement *baseRunningElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *baseRunning = [temp numberFromString:[[baseRunningElement firstChild]content]];
        player.baseRunning = baseRunning;
        NSLog(@"Base Running Value: %@",player.baseRunning);
        elementCount++;
        
        //Set Position
        TFHppleElement *fieldingElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *fielding = [temp numberFromString:[[fieldingElement firstChild]content]];
        player.fielding = fielding;
        NSLog(@"Fielding Value: %@",player.fielding);
        elementCount++;
        
        //Set Position
        TFHppleElement *positionalElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *positional = [temp numberFromString:[[positionalElement firstChild]content]];
        player.positional = positional;
        NSLog(@"Positional Value: %@",player.positional);
        elementCount++;
        
        //Set Position
        TFHppleElement *offenseElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *offense = [temp numberFromString:[[offenseElement firstChild]content]];
        player.offense = offense;
        NSLog(@"Offense Value: %@",player.offense);
        elementCount++;
        
        //Set Position
        TFHppleElement *defenseElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *defense = [temp numberFromString:[[defenseElement firstChild]content]];
        player.defense = defense;
        NSLog(@"Defense Value: %@",player.defense);
        elementCount++;
        
        //Set Position
        TFHppleElement *leagueElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *league = [temp numberFromString:[[leagueElement firstChild]content]];
        player.league = league;
        NSLog(@"League Value: %@",player.league);
        elementCount++;
        
        //Set Position
        TFHppleElement *replacementElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *replacement = [temp numberFromString:[[replacementElement firstChild]content]];
        player.replacement = replacement;
        NSLog(@"Replacement Value: %@",player.replacement);
        elementCount++;
        
        //Set Position
        TFHppleElement *runsAboveReplacementElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *runsAboveReplacement = [temp numberFromString:[[runsAboveReplacementElement firstChild]content]];
        player.runsAboveReplacement = runsAboveReplacement;
        NSLog(@"RAR: %@",player.runsAboveReplacement);
        elementCount++;
        
        //Set Position
        TFHppleElement *winsAboveReplacementElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *winsAboveReplacement = [temp numberFromString:[[winsAboveReplacementElement firstChild]content]];
        player.winsAboveReplacement = winsAboveReplacement;
        NSLog(@"WAR: %@",player.winsAboveReplacement);
        elementCount++;
        
        //Set Position
        TFHppleElement *dollarsElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *dollars = [strMan removeDollarSign:[[dollarsElement firstChild]content]];
        player.dollars = dollars;
        NSLog(@"Dollars: %@",player.dollars);
        elementCount++;
        
        //Set Position
        TFHppleElement *salaryElement = [valueNodes objectAtIndex:elementCount];
        NSNumber *salary = [strMan removeDollarSign:[[salaryElement firstChild]content]];
        player.salary = salary;
        NSLog(@"Salary: %@",player.salary);
        elementCount++;
        
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
