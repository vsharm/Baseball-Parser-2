//
//  ParseplateDiscipline.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/19/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePlateDiscipline.h"
#import "StringManipulation.h"

@implementation ParsePlateDiscipline
@synthesize webpage;
@synthesize plateDiscipline;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    plateDiscipline = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:plateDiscipline
                                                                forKey:@"PlateDiscipline"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PlateDiscipline" object:nil userInfo:orientationData];
    });
}

//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason7_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason7_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *plateDisciplineNodeXPath = @"//*[@id='SeasonStats1_dgSeason7_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *plateDisciplineNode = [FGPlayerParser searchWithXPathQuery:plateDisciplineNodeXPath];
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    StringManipulation *strMan = [[StringManipulation alloc] init];
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((11)*i);
        
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
        
        TFHppleElement *oSwingPercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *oSwingPercentageString =  [[oSwingPercentageElement firstChild]content];
        player.oSwingPercentage = [strMan removePercentage:oSwingPercentageString];
        NSLog(@"O-Swing percentage: %@",player.oSwingPercentage);
        elementCount++;
        
        TFHppleElement *zSwingPercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *zSwingPercentageString =  [[zSwingPercentageElement firstChild]content];
        player.zSwingPercentage = [strMan removePercentage:zSwingPercentageString];
        NSLog(@"Z-Swing percentage: %@",player.zSwingPercentage);
        elementCount++;
        
        TFHppleElement *swingPercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *swingPercentageString =  [[swingPercentageElement firstChild]content];
        player.swingPercentage = [strMan removePercentage:swingPercentageString];
        NSLog(@"Swing percentage: %@",player.swingPercentage);
        elementCount++;
        
        TFHppleElement *oContactPercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *oContactPercentageString =  [[oContactPercentageElement firstChild]content];
        player.oContactPercentage = [strMan removePercentage:oContactPercentageString];
        NSLog(@"O-Contact percentage: %@",player.oContactPercentage);
        elementCount++;
        
        TFHppleElement *zContactPercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *zContactPercentageString =  [[zContactPercentageElement firstChild]content];
        player.zContactPercentage = [strMan removePercentage:zContactPercentageString];
        NSLog(@"Z-Contact percentage: %@",player.zContactPercentage);
        elementCount++;
        
        TFHppleElement *contactPercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *contactPercentageString =  [[contactPercentageElement firstChild]content];
        player.contactPercentage = [strMan removePercentage:contactPercentageString];
        NSLog(@"Contact percentage: %@",player.contactPercentage);
        elementCount++;
        
        TFHppleElement *zonePercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *zonePercentageString =  [[zonePercentageElement firstChild]content];
        player.zonePercentage = [strMan removePercentage:zonePercentageString];
        NSLog(@"Zone percentage: %@",player.zonePercentage);
        elementCount++;
        
        TFHppleElement *fStrikePercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *fStrikePercentageString =  [[fStrikePercentageElement firstChild]content];
        player.fStrikePercentage = [strMan removePercentage:fStrikePercentageString];
        NSLog(@"F-Strike percentage: %@",player.fStrikePercentage);
        elementCount++;
        
        TFHppleElement *swingingStrikePercentageElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *swingingStrikePercentageString =  [[swingingStrikePercentageElement firstChild]content];
        player.swingingStrikePercentage = [strMan removePercentage:swingingStrikePercentageString];
        NSLog(@"Swinging Strike percentage: %@",player.swingingStrikePercentage);
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}




@end
