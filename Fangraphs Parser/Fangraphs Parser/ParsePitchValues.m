//
//  ParsePitchValues.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/16/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePitchValues.h"

@implementation ParsePitchValues
@synthesize webpage;
@synthesize pitchValues;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    pitchValues = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:pitchValues
                                                                forKey:@"PitchValues"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PitchValues" object:nil userInfo:orientationData];
    });
}




//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN pitchFXPitchType");
    
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason10_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason10_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    //Table Xpath
    NSString *pitchValuesXPath = @"//*[@id='SeasonStats1_dgSeason10_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *pitchValuesNodes = [FGPlayerParser searchWithXPathQuery:pitchValuesXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    //*[@id="SeasonStats1_dgSeason16_ctl00"]
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = ((16)*i);
        
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
        
        TFHppleElement *weightedFastballElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedFastball = [temp numberFromString:[[weightedFastballElement firstChild]content]];
        player.weightedFastball = weightedFastball;
        NSLog(@"wFastball Value: %@",player.weightedFastball);
        elementCount++;
        
        TFHppleElement *weightedSliderElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSlider = [temp numberFromString:[[weightedSliderElement firstChild]content]];
        player.weightedSlider = weightedSlider;
        NSLog(@"wSlider Value: %@",player.weightedSlider);
        elementCount++;
        
        TFHppleElement *weightedCutterElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedCutter = [temp numberFromString:[[weightedCutterElement firstChild]content]];
        player.weightedCutter = weightedCutter;
        NSLog(@"wCutter Value: %@",player.weightedCutter);
        elementCount++;
        
        TFHppleElement *weightedCurveballElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedCurveball = [temp numberFromString:[[weightedCurveballElement firstChild]content]];
        player.weightedCurveball = weightedCurveball;
        NSLog(@"wCurveball Value: %@",player.weightedCurveball);
        elementCount++;
        
        TFHppleElement *weightedChangeupElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedChangeup = [temp numberFromString:[[weightedChangeupElement firstChild]content]];
        player.weightedChangeup = weightedChangeup;
        NSLog(@"wChangeup Value: %@",player.weightedChangeup);
        elementCount++;
        
        TFHppleElement *weightedSplitfingerElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSplitfinger = [temp numberFromString:[[weightedSplitfingerElement firstChild]content]];
        player.weightedSplitfinger = weightedSplitfinger;
        NSLog(@"wSplitfinger Value: %@",player.weightedSplitfinger);
        elementCount++;
        
        TFHppleElement *weightedKnuckleballElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedKnuckleball = [temp numberFromString:[[weightedKnuckleballElement firstChild]content]];
        player.weightedKnuckleball = weightedKnuckleball;
        NSLog(@"wKnuckeball Value: %@",player.weightedKnuckleball);
        elementCount++;
        
        
        TFHppleElement *weightedFastballOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedFastballOver100 = [temp numberFromString:[[weightedFastballOver100Element firstChild]content]];
        player.weightedFastballOver100 = weightedFastballOver100;
        NSLog(@"wFastball Value Per 100: %@",player.weightedFastballOver100);
        elementCount++;
        
        TFHppleElement *weightedSliderOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSliderOver100 = [temp numberFromString:[[weightedSliderOver100Element firstChild]content]];
        player.weightedSliderOver100 = weightedSliderOver100;
        NSLog(@"wSlider Value Per 100: %@",player.weightedSliderOver100);
        elementCount++;
        
        
        TFHppleElement *weightedCutterOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedCutterOver100 = [temp numberFromString:[[weightedCutterOver100Element firstChild]content]];
        player.weightedCutterOver100 = weightedCutterOver100;
        NSLog(@"wCutter Value Per 100: %@",player.weightedCutterOver100);
        elementCount++;
        
        
        TFHppleElement *weightedCurveballOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedCurveballOver100 = [temp numberFromString:[[weightedCurveballOver100Element firstChild]content]];
        player.weightedCurveballOver100 = weightedCurveballOver100;
        NSLog(@"wCurveball Value Per 100: %@",player.weightedCurveballOver100);
        elementCount++;
        
        TFHppleElement *weightedChangeupOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedChangeupOver100 = [temp numberFromString:[[weightedChangeupOver100Element firstChild]content]];
        player.weightedChangeupOver100 = weightedChangeupOver100;
        NSLog(@"wChangeup Value Per 100: %@",player.weightedChangeupOver100);
        elementCount++;
        
        TFHppleElement *weightedSplitfingerOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSplitfingerOver100 = [temp numberFromString:[[weightedSplitfingerOver100Element firstChild]content]];
        player.weightedSplitfingerOver100 = weightedSplitfingerOver100;
        NSLog(@"wSplitFinger Value Per 100: %@",player.weightedSplitfingerOver100);
        elementCount++;
        
        TFHppleElement *weightedKnuckleballOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedKnuckleballOver100 = [temp numberFromString:[[weightedKnuckleballOver100Element firstChild]content]];
        player.weightedKnuckleballOver100 = weightedKnuckleballOver100;
        NSLog(@"wKnuckleball Value Per 100: %@",player.weightedKnuckleballOver100);
        elementCount++;


        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end
