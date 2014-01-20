//
//  ParsePlateDisciplinePitchFX.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/19/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePlateDisciplinePitchFX.h"
#import "StringManipulation.h"

@implementation ParsePlateDisciplinePitchFX
@synthesize webpage;
@synthesize plateDisciplinePitchFX;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    plateDisciplinePitchFX = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:plateDisciplinePitchFX
                                                                forKey:@"PlateDisciplinePitchFX"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PlateDisciplinePitchFX" object:nil userInfo:orientationData];
    });
}

//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason18_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason18_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *plateDisciplineNodeXPath = @"//*[@id='SeasonStats1_dgSeason18_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *plateDisciplineNode = [FGPlayerParser searchWithXPathQuery:plateDisciplineNodeXPath];
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    StringManipulation *strMan = [[StringManipulation alloc] init];
    
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
        
        TFHppleElement *oSwingPercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *oSwingPercentagePFXString =  [[oSwingPercentagePFXElement firstChild]content];
        player.oSwingPercentagePFX = [strMan removePercentage:oSwingPercentagePFXString];
        NSLog(@"O-Swing percentage PFX: %@",player.oSwingPercentagePFX);
        elementCount++;
        
        TFHppleElement *zSwingPercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *zSwingPercentagePFXString =  [[zSwingPercentagePFXElement firstChild]content];
        player.zSwingPercentagePFX = [strMan removePercentage:zSwingPercentagePFXString];
        NSLog(@"Z-Swing percentage PFX: %@",player.zSwingPercentagePFX);
        elementCount++;
        
        TFHppleElement *swingPercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *swingPercentagePFXString =  [[swingPercentagePFXElement firstChild]content];
        player.swingPercentagePFX = [strMan removePercentage:swingPercentagePFXString];
        NSLog(@"Swing percentage PFX: %@",player.swingPercentagePFX);
        elementCount++;
        
        TFHppleElement *oContactPercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *oContactPercentagePFXString =  [[oContactPercentagePFXElement firstChild]content];
        player.oContactPercentagePFX = [strMan removePercentage:oContactPercentagePFXString];
        NSLog(@"O-Contact percentage PFX: %@",player.oContactPercentagePFX);
        elementCount++;
        
        TFHppleElement *zContactPercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *zContactPercentagePFXString =  [[zContactPercentagePFXElement firstChild]content];
        player.zContactPercentagePFX = [strMan removePercentage:zContactPercentagePFXString];
        NSLog(@"Z-Contact percentage PFX: %@",player.zContactPercentagePFX);
        elementCount++;
        
        TFHppleElement *contactPercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *contactPercentagePFXString =  [[contactPercentagePFXElement firstChild]content];
        player.contactPercentagePFX = [strMan removePercentage:contactPercentagePFXString];
        NSLog(@"Contact percentage PFX: %@",player.contactPercentagePFX);
        elementCount++;
        
        TFHppleElement *zonePercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSString *zonePercentagePFXString =  [[zonePercentagePFXElement firstChild]content];
        player.zonePercentagePFX = [strMan removePercentage:zonePercentagePFXString];
        NSLog(@"Zone percentage PFX: %@",player.zonePercentagePFX);
        elementCount++;
        
        TFHppleElement *pacePercentagePFXElement = [plateDisciplineNode objectAtIndex:elementCount];
        NSNumber *pace =  [temp numberFromString:[[pacePercentagePFXElement firstChild]content]];
        player.pace = pace;
        NSLog(@"Pace: %@",player.pace);
        elementCount++;

        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
