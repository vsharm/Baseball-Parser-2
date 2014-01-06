//
//  ParseAdvancedHitting.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 9/16/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "ParseAdvancedHitting.h"
#import "StringManipulation.h"

@implementation ParseAdvancedHitting
@synthesize webpage;
@synthesize advanced;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    advanced = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:advanced
                                                                forKey:@"AdvancedHitting"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AdvancedHitting" object:nil userInfo:orientationData];
    });
}

//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN ADVANCED STATS");

    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason2_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason2_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *advHitterXPath = @"//*[@id='SeasonStats1_dgSeason2_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *advHitterNodes = [FGPlayerParser searchWithXPathQuery:advHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    StringManipulation *strMan = [[StringManipulation alloc] init];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((18)*i);
        
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
        
        TFHppleElement *bbPercentageElement = [advHitterNodes objectAtIndex:elementCount];
        NSString *bbPercentageString =  [[bbPercentageElement firstChild]content];
        player.baseOnBallPercentage = [strMan removePercentage:bbPercentageString];
        NSLog(@"BB percentage: %@",player.baseOnBallPercentage);
        elementCount++;
        
        TFHppleElement *soPercentageElement = [advHitterNodes objectAtIndex:elementCount];
        NSString *soPercentageString =  [[soPercentageElement firstChild]content];
        player.strikeoutPercentage = [strMan removePercentage:soPercentageString];;
        NSLog(@"K percentage: %@",player.strikeoutPercentage);
        elementCount++;
        
        TFHppleElement *walkToStrikeoutRatioElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *walkToStrikeoutRatio = [temp numberFromString:[[walkToStrikeoutRatioElement firstChild]content]];
        player.walkToStrikeoutRatio = walkToStrikeoutRatio;
        NSLog(@"BB/K: %@",player.walkToStrikeoutRatio);
        elementCount++;
        
        TFHppleElement *averageElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *average = [temp numberFromString:[[averageElement firstChild]content]];
        player.average = average;
        NSLog(@"AVG: %@",player.average);
        elementCount++;
        
        TFHppleElement *onBasePercentageElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *onBasePercentage = [temp numberFromString:[[onBasePercentageElement firstChild]content]];
        player.onBasePercentage = onBasePercentage;
        NSLog(@"OBP: %@",player.onBasePercentage);
        elementCount++;
        
        TFHppleElement *sluggingPercentageElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *sluggingPercentage = [temp numberFromString:[[sluggingPercentageElement firstChild]content]];
        player.sluggingPercentage = sluggingPercentage;
        NSLog(@"SLG: %@",player.sluggingPercentage);
        elementCount++;
        
        TFHppleElement *onBasePlusSluggingElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *onBasePlusSlugging = [temp numberFromString:[[onBasePlusSluggingElement firstChild]content]];
        player.onBasePlusSlugging = onBasePlusSlugging;
        NSLog(@"OPS: %@",player.onBasePlusSlugging);
        elementCount++;
        
        TFHppleElement *isolatedSluggingElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *isolatedSlugging = [temp numberFromString:[[isolatedSluggingElement firstChild]content]];
        player.isolatedSlugging = isolatedSlugging;
        NSLog(@"ISO: %@",player.isolatedSlugging);
        elementCount++;
        
        TFHppleElement *speedElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *speed = [temp numberFromString:[[speedElement firstChild]content]];
        player.speed = speed;
        NSLog(@"SPD: %@",player.speed);
        elementCount++;
        
        TFHppleElement *babipElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *babip = [temp numberFromString:[[babipElement firstChild]content]];
        player.babip = babip;
        NSLog(@"BABIP: %@",player.babip);
        elementCount++;
        
        TFHppleElement *ubrElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *ubr = [temp numberFromString:[[ubrElement firstChild]content]];
        player.ubr = ubr;
        NSLog(@"UBR: %@",player.ubr);
        elementCount++;
        
        TFHppleElement *wSBElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *wSB = [temp numberFromString:[[wSBElement firstChild]content]];
        player.wSB = wSB;
        NSLog(@"wSB: %@",player.wSB);
        elementCount++;
        
        TFHppleElement *wRCElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *wRC = [temp numberFromString:[[wRCElement firstChild]content]];
        player.wRC = wRC;
        NSLog(@"wRC: %@",player.wRC);
        elementCount++;
        
        TFHppleElement *wRAAElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *wRAA = [temp numberFromString:[[wRAAElement firstChild]content]];
        player.wRAA = wRAA;
        NSLog(@"wRAA: %@",player.wRAA);
        elementCount++;
        
        TFHppleElement *shElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *sh = [temp numberFromString:[[shElement firstChild]content]];
        player.wOBA = sh;
        NSLog(@"wOBA: %@",player.wOBA);
        elementCount++;
        
        TFHppleElement *wRCPlusElement = [advHitterNodes objectAtIndex:elementCount];
        NSNumber *wRCPlus = [temp numberFromString:[[wRCPlusElement firstChild]content]];
        player.wRCPlus = wRCPlus;
        NSLog(@"wRC+: %@",player.wRCPlus);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
