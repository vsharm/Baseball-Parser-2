//
//  ParsePitchFXPitchValues.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/16/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePitchFXPitchValues.h"

@implementation ParsePitchFXPitchValues
@synthesize webpage;
@synthesize pitchFXValues;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    pitchFXValues = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:pitchFXValues
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
        
        TFHppleElement *weightedFastballPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedFastballPFX = [temp numberFromString:[[weightedFastballPFXElement firstChild]content]];
        player.weightedFastballPFX = weightedFastballPFX;
        NSLog(@"wFastball PFX Value: %@",player.weightedFastballPFX);
        elementCount++;
        
        TFHppleElement *weightedTwoseamPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedTwoseamPFX = [temp numberFromString:[[weightedTwoseamPFXElement firstChild]content]];
        player.weightedTwoseamPFX = weightedTwoseamPFX;
        NSLog(@"wTwoseam PFX Value: %@",player.weightedTwoseamPFX);
        elementCount++;
        
        TFHppleElement *weightedCutterPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedCutterPFX = [temp numberFromString:[[weightedCutterPFXElement firstChild]content]];
        player.weightedCutterPFX = weightedCutterPFX;
        NSLog(@"wCutter PFX Value: %@",player.weightedCutterPFX);
        elementCount++;
        
        TFHppleElement *weightedSplitFastballPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSplitFastballPFX = [temp numberFromString:[[weightedSplitFastballPFXElement firstChild]content]];
        player.weightedSplitFastballPFX = weightedSplitFastballPFX;
        NSLog(@"wSplitter PFX Value: %@",player.weightedSplitFastballPFX);
        elementCount++;
        
        TFHppleElement *Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedFastball = [temp numberFromString:[[Element firstChild]content]];
        player.weightedFastball = weightedFastball;
        NSLog(@"wForkball PFX Value: %@",player.weightedForkballPFX);
        elementCount++;
        
        TFHppleElement *weightedSinkerPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSinkerPFX = [temp numberFromString:[[weightedSinkerPFXElement firstChild]content]];
        player.weightedSinkerPFX = weightedSinkerPFX;
        NSLog(@"wSinker PFX Value: %@",player.weightedSinkerPFX);
        elementCount++;
        
        TFHppleElement *weightedSliderPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedSliderPFX = [temp numberFromString:[[weightedSliderPFXElement firstChild]content]];
        player.weightedSliderPFX = weightedSliderPFX;
        NSLog(@"wSlider PFX Value: %@",player.weightedSliderPFX);
        elementCount++;
        
        TFHppleElement *weightedCurveballPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedCurveballPFX = [temp numberFromString:[[weightedCurveballPFXElement firstChild]content]];
        player.weightedCurveballPFX = weightedCurveballPFX;
        NSLog(@"wCurveball PFX Value: %@",player.weightedCurveballPFX);
        elementCount++;
        
        TFHppleElement *weightedKnuckleCurveballPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedKnuckleCurveballPFX = [temp numberFromString:[[weightedKnuckleCurveballPFXElement firstChild]content]];
        player.weightedKnuckleCurveballPFX = weightedKnuckleCurveballPFX;
        NSLog(@"wKnuckleCurve PFX Value: %@",player.weightedKnuckleCurveballPFX);
        elementCount++;
        
        TFHppleElement *weightedEphusPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedEphusPFX = [temp numberFromString:[[weightedEphusPFXElement firstChild]content]];
        player.weightedEphusPFX = weightedEphusPFX;
        NSLog(@"wEphus PFX Value: %@",player.weightedEphusPFX);
        elementCount++;
        
        TFHppleElement *weightedChangeupPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedChangeupPFX = [temp numberFromString:[[weightedChangeupPFXElement firstChild]content]];
        player.weightedChangeupPFX = weightedChangeupPFX;
        NSLog(@"wChangeup PFX Value: %@",player.weightedChangeupPFX);
        elementCount++;
        
        TFHppleElement *weightedScrewballPFXElement = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedScrewballPFX = [temp numberFromString:[[weightedScrewballPFXElement firstChild]content]];
        player.weightedScrewballPFX = weightedScrewballPFX;
        NSLog(@"wScrewball PFX Value: %@",player.weightedScrewballPFX);
        elementCount++;
        
        TFHppleElement *weightedFastballOver100Element = [pitchValuesNodes objectAtIndex:elementCount];
        NSNumber *weightedFastballOver100 = [temp numberFromString:[[weightedFastballOver100Element firstChild]content]];
        player.weightedFastballOver100 = weightedFastballOver100;
        NSLog(@"wKnuckleball PFX Value: %@",player.weightedKnuckleballPFX);
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
