//
//  ParseFielding.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/12/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseFielding.h"

@implementation ParseFielding
@synthesize webpage;
@synthesize fielding;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    fielding = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:fielding
                                                                forKey:@"Fielding"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Fielding" object:nil userInfo:orientationData];
    });
}


-(NSArray *)getPlayer{
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *fieldingXPath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *fieldingNodes = [FGPlayerParser searchWithXPathQuery:fieldingXPath];
    
    NSString *positionNodesXPath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[3]/a";
    NSArray *positionNodes = [FGPlayerParser searchWithXPathQuery:positionNodesXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = (22*i);
        
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
        TFHppleElement *gamesElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *games = [temp numberFromString:[[gamesElement firstChild]content]];
        player.games = games;
        NSLog(@"Games: %@",player.games);
        elementCount++;
        
        //Set At Bats
        TFHppleElement *gamesStartedElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *gamesStarted = [temp numberFromString:[[gamesStartedElement firstChild]content]];
        player.gamesStarted = gamesStarted;
        NSLog(@"Games Started: %@",player.gamesStarted);
        elementCount++;
        
        
        //Set At Bats
        TFHppleElement *fieldingInningsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *ab = [temp numberFromString:[[fieldingInningsElement firstChild]content]];
        player.fieldingInnings = ab;
        NSLog(@"Innings: %@",player.fieldingInnings);
        elementCount++;
 
        
        //Set At Bats
        TFHppleElement *putOutsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *putOuts = [temp numberFromString:[[putOutsElement firstChild]content]];
        player.putOuts = putOuts;
        NSLog(@"Put Outs: %@",player.putOuts);
        elementCount++;
 
        
        TFHppleElement *assistsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *assists = [temp numberFromString:[[assistsElement firstChild]content]];
        player.assists = assists;
        NSLog(@"Assists: %@",player.assists);
        elementCount++;
 
        
        TFHppleElement *errorsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *errors = [temp numberFromString:[[errorsElement firstChild]content]];
        player.errors = errors;
        NSLog(@"Errors: %@",player.errors);
        elementCount++;
 
        
        TFHppleElement *fieldingErrorsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *fieldingErrors = [temp numberFromString:[[fieldingErrorsElement firstChild]content]];
        player.fieldingErrors = fieldingErrors;
        NSLog(@"Fielding Errors: %@",player.fieldingErrors);
        elementCount++;
        
        TFHppleElement *throwingErrorsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *throwingErrors = [temp numberFromString:[[throwingErrorsElement firstChild]content]];
        player.throwingErrors = throwingErrors;
        NSLog(@"Throwing Errors: %@",player.throwingErrors);
        elementCount++;
        
        TFHppleElement *doublePlaysElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *doublePlays = [temp numberFromString:[[doublePlaysElement firstChild]content]];
        player.doublePlays = doublePlays;
        NSLog(@"Double Plays: %@",player.doublePlays);
        elementCount++;
        
        TFHppleElement *doublePlaysStartedElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *doublePlaysStarted = [temp numberFromString:[[doublePlaysStartedElement firstChild]content]];
        player.doublePlaysStarted = doublePlaysStarted;
        NSLog(@"Double Plays Started: %@",player.doublePlaysStarted);
        elementCount++;
        
        TFHppleElement *doublePlaysTurnedElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *doublePlaysTurned = [temp numberFromString:[[doublePlaysTurnedElement firstChild]content]];
        player.doublePlaysTurned = doublePlaysTurned;
        NSLog(@"Double Plays Turned: %@",player.doublePlaysTurned);
        elementCount++;
        
        TFHppleElement *doublePlaysFinishedElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *doublePlaysFinished = [temp numberFromString:[[doublePlaysFinishedElement firstChild]content]];
        player.doublePlaysFinished = doublePlaysFinished;
        NSLog(@"Double Plays Finished: %@",player.doublePlaysFinished);
        elementCount++;
        
        TFHppleElement *firstBasemenScoopsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *firstBasemenScoops = [temp numberFromString:[[firstBasemenScoopsElement firstChild]content]];
        player.firstBasemenScoops = firstBasemenScoops;
        NSLog(@"First Baseman Scoops: %@",player.firstBasemenScoops);
        elementCount++;
        
        TFHppleElement *stolenBasesCatchingElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *stolenBasesCatching = [temp numberFromString:[[stolenBasesCatchingElement firstChild]content]];
        player.stolenBasesCatching = stolenBasesCatching;
        NSLog(@"Catcher Stolen Bases: %@",player.stolenBasesCatching);
        elementCount++;
        
        TFHppleElement *caughtStealingCatchingElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *caughtStealingCatching = [temp numberFromString:[[caughtStealingCatchingElement firstChild]content]];
        player.caughtStealingCatching = caughtStealingCatching;
        NSLog(@"Catcher Caught Stealing: %@",player.caughtStealingCatching);
        elementCount++;
        
        TFHppleElement *passedBallsElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *passedBalls = [temp numberFromString:[[passedBallsElement firstChild]content]];
        player.passedBalls = passedBalls;
        NSLog(@"Passed Balls: %@",player.passedBalls);
        elementCount++;
        
        TFHppleElement *wildPitchesElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *wildPitches = [temp numberFromString:[[wildPitchesElement firstChild]content]];
        player.wildPitches = wildPitches;
        NSLog(@"Wild Pitches: %@",player.wildPitches);
        elementCount++;
        
        TFHppleElement *fieldingPercentageElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *fieldingPercentage = [temp numberFromString:[[fieldingPercentageElement firstChild]content]];
        player.fieldingPercentage = fieldingPercentage;
        NSLog(@"Fielding Percentage: %@",player.fieldingPercentage);
        elementCount++;
        
        TFHppleElement *totalZoneElement = [fieldingNodes objectAtIndex:elementCount];
        NSNumber *totalZone = [temp numberFromString:[[totalZoneElement firstChild]content]];
        player.totalZone = totalZone;
        NSLog(@"Total Zone: %@",player.totalZone);
        elementCount++;
        
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end