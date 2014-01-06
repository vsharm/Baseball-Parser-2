//
//  ParseBattedBall.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/2/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParseBattedBall.h"
#import "StringManipulation.h"

@implementation ParseBattedBall
@synthesize webpage;
@synthesize battedBall;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    battedBall = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:battedBall
                                                                forKey:@"BattedBall"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BattedBall" object:nil userInfo:orientationData];
    });
}

//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN Batted Ball");
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason3_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason3_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *battedBallHitterXPath = @"//*[@id='SeasonStats1_dgSeason3_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *battedBallHitterNodes = [FGPlayerParser searchWithXPathQuery:battedBallHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    StringManipulation *strMan = [[StringManipulation alloc] init];
    
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
        
        TFHppleElement *groundballToFlyballRatioElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *groundballToFlyballRatio = [temp numberFromString:[[groundballToFlyballRatioElement firstChild]content]];
        player.groundballToFlyballRatio = groundballToFlyballRatio;
        NSLog(@"Groundball to Flyball Ratio: %@",player.groundballToFlyballRatio);
        elementCount++;
        
        TFHppleElement *lineDrivePercentageElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSString *lineDrivePercentageString =  [[lineDrivePercentageElement firstChild]content];
        player.lineDrivePercentage = [strMan removePercentage:lineDrivePercentageString];
        NSLog(@"Line Drive percentage: %@",player.lineDrivePercentage);
        elementCount++;
        
        TFHppleElement *groundballPercentageElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSString *groundballPercentageString =  [[groundballPercentageElement firstChild]content];
        player.groundballPercentage = [strMan removePercentage:groundballPercentageString];
        NSLog(@"Groundball percentage: %@",player.groundballPercentage);
        elementCount++;
        
        TFHppleElement *flyballPercentageElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSString *flyballPercentageString =  [[flyballPercentageElement firstChild]content];
        player.flyballPercentage = [strMan removePercentage:flyballPercentageString];
        NSLog(@"Flyball percentage: %@",player.flyballPercentage);
        elementCount++;
        
        TFHppleElement *infieldFlyballPercentageElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSString *infieldFlyballPercentageString =  [[infieldFlyballPercentageElement firstChild]content];
        player.infieldFlyballPercentage = [strMan removePercentage:infieldFlyballPercentageString];
        NSLog(@"Infield Flyball percentage: %@",player.infieldFlyballPercentage);
        elementCount++;
        
        TFHppleElement *homerunToFlyballRatioElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSNumber *homerunToFlyballRatio = [temp numberFromString:[[homerunToFlyballRatioElement firstChild]content]];
        player.homerunToFlyballRatio = homerunToFlyballRatio;
        NSLog(@"Homerun to Flyball percentage: %@",player.homerunToFlyballRatio);
        elementCount++;

        TFHppleElement *infieldHitPercentageElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSString *infieldHitPercentageString =  [[infieldHitPercentageElement firstChild]content];
        player.infieldHitPercentage = [strMan removePercentage:infieldHitPercentageString];
        NSLog(@"Infield Flyball percentage: %@",player.infieldHitPercentage);
        elementCount++;

        TFHppleElement *buntHitPercentageElement = [battedBallHitterNodes objectAtIndex:elementCount];
        NSString *buntHitPercentageString =  [[buntHitPercentageElement firstChild]content];
        player.buntHitPercentage = [strMan removePercentage:buntHitPercentageString];
        NSLog(@"Infield Flyball percentage: %@",player.buntHitPercentage);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end
