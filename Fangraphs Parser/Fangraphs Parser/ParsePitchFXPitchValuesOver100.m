//
//  ParsePitchFXPitchValuesOver100.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/18/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePitchFXPitchValuesOver100.h"

@implementation ParsePitchFXPitchValuesOver100
@synthesize webpage;
@synthesize pitchFXValuesOver100;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    pitchFXValuesOver100 = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:pitchFXValuesOver100
                                                                forKey:@"PitchValuesOver100"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PitchValuesOver100" object:nil userInfo:orientationData];
    });
}

//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason20_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason20_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *pitchValuesOver100XPath = @"//*[@id='SeasonStats1_dgSeason20_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *pitchValuesOver100Nodes = [FGPlayerParser searchWithXPathQuery:pitchValuesOver100XPath];
    
    
    
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
        
        TFHppleElement *fastballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *fastballValueOver100PFX = [temp numberFromString:[[fastballValueOver100PFXElement firstChild]content]];
        player.fastballValueOver100PFX = fastballValueOver100PFX;
        NSLog(@"wFastball PFX Value Per 100: %@",player.fastballValueOver100PFX);
        elementCount++;
        
        TFHppleElement *twoseamValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *twoseamValueOver100PFX = [temp numberFromString:[[twoseamValueOver100PFXElement firstChild]content]];
        player.twoseamValueOver100PFX = twoseamValueOver100PFX;
        NSLog(@"wTwoseam PFX Value Per 100: %@",player.twoseamValueOver100PFX);
        elementCount++;
        
        TFHppleElement *cutterValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *cutterValueOver100PFX = [temp numberFromString:[[cutterValueOver100PFXElement firstChild]content]];
        player.cutterValueOver100PFX = cutterValueOver100PFX;
        NSLog(@"wCutter PFX Value Per 100: %@",player.cutterValueOver100PFX);
        elementCount++;
        
        TFHppleElement *splitFastballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *splitFastballValueOver100PFX = [temp numberFromString:[[splitFastballValueOver100PFXElement firstChild]content]];
        player.splitFastballValueOver100PFX = splitFastballValueOver100PFX;
        NSLog(@"wSplitter PFX Value Per 100: %@",player.splitFastballValueOver100PFX);
        elementCount++;
        
        TFHppleElement *forkballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *forkballValueOver100PFX = [temp numberFromString:[[forkballValueOver100PFXElement firstChild]content]];
        player.forkballValueOver100PFX = forkballValueOver100PFX;
        NSLog(@"wForkball PFX Value Per 100: %@",player.forkballValueOver100PFX);
        elementCount++;
        
        TFHppleElement *sinkerValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *sinkerValueOver100PFX = [temp numberFromString:[[sinkerValueOver100PFXElement firstChild]content]];
        player.sinkerValueOver100PFX = sinkerValueOver100PFX;
        NSLog(@"wSinker PFX Value Per 100: %@",player.sinkerValueOver100PFX);
        elementCount++;
        
        TFHppleElement *sliderValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *sliderValueOver100PFX = [temp numberFromString:[[sliderValueOver100PFXElement firstChild]content]];
        player.sliderValueOver100PFX = sliderValueOver100PFX;
        NSLog(@"wSlider PFX Value Per 100: %@",player.sliderValueOver100PFX);
        elementCount++;
        
        TFHppleElement *curveballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *curveballValueOver100PFX = [temp numberFromString:[[curveballValueOver100PFXElement firstChild]content]];
        player.curveballValueOver100PFX = curveballValueOver100PFX;
        NSLog(@"wCurveball PFX Value Per 100: %@",player.curveballValueOver100PFX);
        elementCount++;
        
        TFHppleElement *knuckleCurveballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *knuckleCurveballValueOver100PFX = [temp numberFromString:[[knuckleCurveballValueOver100PFXElement firstChild]content]];
        player.knuckleCurveballValueOver100PFX = knuckleCurveballValueOver100PFX;
        NSLog(@"wKnuckleCurve PFX Value Per 100: %@",player.knuckleCurveballValueOver100PFX);
        elementCount++;
        
        TFHppleElement *ephusValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *ephusValueOver100PFX = [temp numberFromString:[[ephusValueOver100PFXElement firstChild]content]];
        player.ephusValueOver100PFX = ephusValueOver100PFX;
        NSLog(@"wEphus PFX Value Per 100: %@",player.ephusValueOver100PFX);
        elementCount++;
        
        TFHppleElement *changeupValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *changeupValueOver100PFX = [temp numberFromString:[[changeupValueOver100PFXElement firstChild]content]];
        player.changeupValueOver100PFX = changeupValueOver100PFX;
        NSLog(@"wChangeup PFX Value Per 100: %@",player.changeupValueOver100PFX);
        elementCount++;
        
        TFHppleElement *screwballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *screwballValueOver100PFX = [temp numberFromString:[[screwballValueOver100PFXElement firstChild]content]];
        player.screwballValueOver100PFX = screwballValueOver100PFX;
        NSLog(@"wScrewball PFX Value Per 100: %@",player.screwballValueOver100PFX);
        elementCount++;
        
        TFHppleElement *knuckleballValueOver100PFXElement = [pitchValuesOver100Nodes objectAtIndex:elementCount];
        NSNumber *knuckleballValueOver100PFX = [temp numberFromString:[[knuckleballValueOver100PFXElement firstChild]content]];
        player.knuckleballValueOver100PFX = knuckleballValueOver100PFX;
        NSLog(@"wKnuckleball PFX Value Per 100: %@",player.knuckleballValueOver100PFX);
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}



@end
