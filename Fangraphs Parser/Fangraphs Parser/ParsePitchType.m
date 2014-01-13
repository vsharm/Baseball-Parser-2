//
//  PitchType.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/11/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePitchType.h"
#import "StringManipulation.h"

@implementation ParsePitchType
@synthesize webpage;
@synthesize pitchType;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    pitchType = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:pitchType
                                                                forKey:@"PitchType"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PitchType" object:nil userInfo:orientationData];
    });
}



//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN PitchType");
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason6_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason6_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *pitchTypeHitterNodesXPath = @"//*[@id='SeasonStats1_dgSeason6_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *pitchTypeHitterNodes = [FGPlayerParser searchWithXPathQuery:pitchTypeHitterNodesXPath];
    
    
    
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
        
        TFHppleElement *fastballPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *fastballPercentageString =  [[fastballPercentageElement firstChild]content];
        player.fastballPercentage = [strMan removePercentage:fastballPercentageString];
        NSLog(@"Fastball percentage: %@",player.fastballPercentage);
        elementCount++;
        
        TFHppleElement *cutterPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *cutterPercentageString =  [[cutterPercentageElement firstChild]content];
        player.cutterPercentage = [strMan removePercentage:cutterPercentageString];
        NSLog(@"Cutter percentage: %@",player.cutterPercentage);
        elementCount++;
        
        TFHppleElement *splitFastballPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *splitFastballPercentageString =  [[splitFastballPercentageElement firstChild]content];
        player.splitfingerPercentage = [strMan removePercentage:splitFastballPercentageString];
        NSLog(@"Splitter percentage: %@",player.splitfingerPercentage);
        elementCount++;
        
        TFHppleElement *sliderPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *sliderPercentageString =  [[sliderPercentageElement firstChild]content];
        player.sliderPercentage = [strMan removePercentage:sliderPercentageString];
        NSLog(@"Slider percentage: %@",player.sliderPercentage);
        elementCount++;
        
        TFHppleElement *curveballPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *curveballPercentageString =  [[curveballPercentageElement firstChild]content];
        player.curveBallPercentage = [strMan removePercentage:curveballPercentageString];
        NSLog(@"Curveball percentage: %@",player.curveBallPercentage);
        elementCount++;
        
        TFHppleElement *changeupPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *changeupPercentageString =  [[changeupPercentageElement firstChild]content];
        player.changeupPercentage = [strMan removePercentage:changeupPercentageString];
        NSLog(@"Changeup percentage: %@",player.changeupPercentage);
        elementCount++;
        
        TFHppleElement *knuckleballPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *knuckleballPercentageString =  [[knuckleballPercentageElement firstChild]content];
        player.knuckleballPercentage = [strMan removePercentage:knuckleballPercentageString];
        NSLog(@"Knuckleball percentage: %@",player.knuckleballPercentage);
        elementCount++;
        
        TFHppleElement *unknownPercentageElement = [pitchTypeHitterNodes objectAtIndex:elementCount];
        NSString *unknownPercentageString =  [[unknownPercentageElement firstChild]content];
        player.unknownPercentage = [strMan removePercentage:unknownPercentageString];
        NSLog(@"Unknown percentage: %@",player.unknownPercentage);
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end