//
//  ParseWinProbability.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/11/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseWinProbability.h"

@implementation ParseWinProbability
@synthesize webpage;
@synthesize winProbability;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    winProbability = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:winProbability
                                                                forKey:@"WinProbability"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"WinProbability" object:nil userInfo:orientationData];
    });
}


//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN Win Probability");
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason5_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason5_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *winProbabilityHitterXPath = @"//*[@id='SeasonStats1_dgSeason5_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *winProbabilityHitterNodes = [FGPlayerParser searchWithXPathQuery:winProbabilityHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((12)*i);
        
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
        
        TFHppleElement *winProbabilityAddedElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *winProbabilityAdded = [temp numberFromString:[[winProbabilityAddedElement firstChild]content]];
        player.winProbabilityAdded = winProbabilityAdded;
        NSLog(@"WPA: %@",player.winProbabilityAdded);
        elementCount++;
        
        TFHppleElement *negativeWinProbabilityElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *negativeWinProbability = [temp numberFromString:[[negativeWinProbabilityElement firstChild]content]];
        player.negativeWinProbability = negativeWinProbability;
        NSLog(@"-WPA: %@",player.negativeWinProbability);
        elementCount++;
        
        TFHppleElement *positiveWinProbabilityElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *positiveWinProbability = [temp numberFromString:[[positiveWinProbabilityElement firstChild]content]];
        player.positiveWinProbability = positiveWinProbability;
        NSLog(@"+WPA: %@",player.positiveWinProbability);
        elementCount++;
        
        TFHppleElement *runsAboveAverage24Element = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *runsAboveAverage24 = [temp numberFromString:[[runsAboveAverage24Element firstChild]content]];
        player.runsAboveAverage24 = runsAboveAverage24;
        NSLog(@"RE24: %@",player.runsAboveAverage24);
        elementCount++;
        
        TFHppleElement *runsAboveAverageWinsElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *runsAboveAverageWins = [temp numberFromString:[[runsAboveAverageWinsElement firstChild]content]];
        player.runsAboveAverageWins = runsAboveAverageWins;
        NSLog(@"REW: %@",player.runsAboveAverageWins);
        elementCount++;
        
        TFHppleElement *pLeverageIndexElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *pLeverageIndex = [temp numberFromString:[[pLeverageIndexElement firstChild]content]];
        player.pLeverageIndex = pLeverageIndex;
        NSLog(@"pLI: %@",player.pLeverageIndex);
        elementCount++;
        
        TFHppleElement *pinchHitLeverageIndexElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *pinchHitLeverageIndex = [temp numberFromString:[[pinchHitLeverageIndexElement firstChild]content]];
        player.pinchHitLeverageIndex = pinchHitLeverageIndex;
        NSLog(@"phLI: %@",player.pinchHitLeverageIndex);
        elementCount++;
        
        TFHppleElement *pinchHitElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *pinchHit = [temp numberFromString:[[pinchHitElement firstChild]content]];
        player.pinchHit = pinchHit;
        NSLog(@"Pinch Hits: %@",player.pinchHit);
        elementCount++;
        
        TFHppleElement *winProbabilityOverLeverageIndexElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *winProbabilityOverLeverageIndex = [temp numberFromString:[[winProbabilityOverLeverageIndexElement firstChild]content]];
        player.winProbabilityOverLeverageIndex = winProbabilityOverLeverageIndex;
        NSLog(@"WPA/LI: %@",player.winProbabilityOverLeverageIndex);
        elementCount++;
        
        TFHppleElement *clutchElement = [winProbabilityHitterNodes objectAtIndex:elementCount];
        NSNumber *clutch = [temp numberFromString:[[clutchElement firstChild]content]];
        player.clutch = clutch;
        NSLog(@"Clutch: %@",player.clutch);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end

