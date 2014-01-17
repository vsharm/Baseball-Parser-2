//
//  ParsePitchFXPitchVelocity.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/16/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePitchFXPitchVelocity.h"

@implementation ParsePitchFXPitchVelocity
@synthesize webpage;
@synthesize pitchFXVelocity;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    pitchFXVelocity = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:pitchFXVelocity
                                                                forKey:@"PitchFXPitchType"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PitchFXPitchType" object:nil userInfo:orientationData];
    });
}




//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN pitchFXPitchType");
    
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason17_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason17_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *pitchVelocityHitterPFXXPath = @"//*[@id='SeasonStats1_dgSeason17_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *pitchVelocityHitterPFXNodes = [FGPlayerParser searchWithXPathQuery:pitchVelocityHitterPFXXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    //*[@id="SeasonStats1_dgSeason16_ctl00"]
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((15)*i);
        
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

        TFHppleElement *fastballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *fastballVelocity = [temp numberFromString:[[fastballVelocityElement firstChild]content]];
        player.fastballVelocity = fastballVelocity;
        NSLog(@"Fastball Velocity: %@",player.fastballVelocity);
        elementCount++;
        
        TFHppleElement *twoseamVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *twoseamVelocity = [temp numberFromString:[[twoseamVelocityElement firstChild]content]];
        player.twoseamVelocity = twoseamVelocity;
        NSLog(@"TwoSeam Velocity: %@",player.twoseamVelocity);
        elementCount++;
        
        TFHppleElement *cutterVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *cutterVelocity = [temp numberFromString:[[cutterVelocityElement firstChild]content]];
        player.cutterVelocity = cutterVelocity;
        NSLog(@"Cutter Velocity: %@",player.cutterVelocity);
        elementCount++;
        
        TFHppleElement *splitFastballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *splitFastballVelocity = [temp numberFromString:[[splitFastballVelocityElement firstChild]content]];
        player.splitFastballVelocity = splitFastballVelocity;
        NSLog(@"Splitfinger Velocity: %@",player.splitFastballVelocity);
        elementCount++;
        
        TFHppleElement *forkballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *forkballVelocity = [temp numberFromString:[[forkballVelocityElement firstChild]content]];
        player.forkballVelocity = forkballVelocity;
        NSLog(@"Forkball Velocity: %@",player.forkballVelocity);
        elementCount++;
        
        TFHppleElement *sinkerVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *sinkerVelocity = [temp numberFromString:[[sinkerVelocityElement firstChild]content]];
        player.sinkerVelocity = sinkerVelocity;
        NSLog(@"Sinker Velocity: %@",player.sinkerVelocity);
        elementCount++;
        
        TFHppleElement *sliderVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *sliderVelocity = [temp numberFromString:[[sliderVelocityElement firstChild]content]];
        player.sliderVelocity = sliderVelocity;
        NSLog(@"Slider Velocity: %@",player.sliderVelocity);
        elementCount++;
        
        TFHppleElement *curveballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *curveballVelocity = [temp numberFromString:[[curveballVelocityElement firstChild]content]];
        player.curveballVelocity = curveballVelocity;
        NSLog(@"Cutter Velocity: %@",player.curveballVelocity);
        elementCount++;
        
        TFHppleElement *knuckleCurveballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *knuckleCurveballVelocity = [temp numberFromString:[[knuckleCurveballVelocityElement firstChild]content]];
        player.knuckleCurveballVelocity = knuckleCurveballVelocity;
        NSLog(@"Knucklecurve Velocity: %@",player.knuckleCurveballVelocity);
        elementCount++;
        
        TFHppleElement *ephusVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *ephusVelocity = [temp numberFromString:[[ephusVelocityElement firstChild]content]];
        player.ephusVelocity = ephusVelocity;
        NSLog(@"Ephus Velocity: %@",player.ephusVelocity);
        elementCount++;
        
        TFHppleElement *changeupVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *changeupVelocity = [temp numberFromString:[[changeupVelocityElement firstChild]content]];
        player.changeupVelocity = changeupVelocity;
        NSLog(@"Changeup Velocity: %@",player.changeupVelocity);
        elementCount++;
        
        TFHppleElement *screwballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *screwballVelocity = [temp numberFromString:[[screwballVelocityElement firstChild]content]];
        player.screwballVelocity = screwballVelocity;
        NSLog(@"Screwball Velocity: %@",player.screwballVelocity);
        elementCount++;

        TFHppleElement *knuckleballVelocityElement = [pitchVelocityHitterPFXNodes objectAtIndex:elementCount];
        NSNumber *knuckleballVelocity = [temp numberFromString:[[knuckleballVelocityElement firstChild]content]];
        player.knuckleballVelocity = knuckleballVelocity;
        NSLog(@"Knuckleball Velocity: %@",player.knuckleballVelocity);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end
