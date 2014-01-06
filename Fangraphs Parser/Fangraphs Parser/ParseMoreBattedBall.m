//
//  ParseMoreBattedBall.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/4/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseMoreBattedBall.h"
#import "StringManipulation.h"

@implementation ParseMoreBattedBall
@synthesize webpage;
@synthesize moreBattedBall;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    moreBattedBall = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:moreBattedBall
                                                                forKey:@"MoreBattedBall"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MoreBattedBall" object:nil userInfo:orientationData];
    });
}

//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN Batted Ball");
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason4_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason4_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *battedBallHitterXPath = @"//*[@id='SeasonStats1_dgSeason4_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *battedBallHitterNodes = [FGPlayerParser searchWithXPathQuery:battedBallHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((10)*i);
        
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
        
        TFHppleElement *groundballElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *groundball = [temp numberFromString:[[groundballElement firstChild]content]];
        player.groundball = groundball;
        NSLog(@"Groundballs: %@",player.groundball);
        elementCount++;
        
        TFHppleElement *flyballElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *flyball = [temp numberFromString:[[flyballElement firstChild]content]];
        player.flyball = flyball;
        NSLog(@"Flyballs: %@",player.flyball);
        elementCount++;
        
        TFHppleElement *lineDriveElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *lineDrive = [temp numberFromString:[[lineDriveElement firstChild]content]];
        player.linedrive = lineDrive;
        NSLog(@"Linedrive: %@",player.linedrive);
        elementCount++;
        
        TFHppleElement *infieldFlyballElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *infieldFlyball = [temp numberFromString:[[infieldFlyballElement firstChild]content]];
        player.infieldFlyball = infieldFlyball;
        NSLog(@"Infield Flyballs: %@",player.infieldFlyball);
        elementCount++;
        
        TFHppleElement *infieldHitElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *infieldHit = [temp numberFromString:[[infieldHitElement firstChild]content]];
        player.infieldHit = infieldHit;
        NSLog(@"Infield Hits: %@",player.infieldHit);
        elementCount++;
        
        TFHppleElement *buntElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *bunt = [temp numberFromString:[[buntElement firstChild]content]];
        player.bunt = bunt;
        NSLog(@"Bunts: %@",player.bunt);
        elementCount++;
        
        TFHppleElement *bunthitElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *bunthit = [temp numberFromString:[[bunthitElement firstChild]content]];
        player.bunthit = bunthit;
        NSLog(@"Bunt Hits: %@",player.bunthit);
        elementCount++;
        
        TFHppleElement *strikesElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *strikes = [temp numberFromString:[[strikesElement firstChild]content]];
        player.strikes = strikes;
        NSLog(@"Strikes: %@",player.strikes);
        elementCount++;
        
        TFHppleElement *pitchesElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *pitches = [temp numberFromString:[[pitchesElement firstChild]content]];
        player.pitches = pitches;
        NSLog(@"Pitches: %@",player.pitches);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end

