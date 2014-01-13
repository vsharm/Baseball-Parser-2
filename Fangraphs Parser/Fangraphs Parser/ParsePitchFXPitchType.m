//
//  PitchFXPitchType.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 1/11/14.
//  Copyright (c) 2014 Varun Sharma. All rights reserved.
//

#import "ParsePitchFXPitchType.h"
#import "StringManipulation.h"


@implementation ParsePitchFXPitchType
@synthesize webpage;
@synthesize pitchFX;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {

    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    pitchFX = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:pitchFX
                                                                forKey:@"PitchFXPitchType"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PitchFXPitchType" object:nil userInfo:orientationData];
    });
}




//RELEVENT DATA NEEDED
-(NSArray *)getPlayer{
    
    NSLog(@"IN pitchFXPitchType");
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason16_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason16_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *pitchTypeHitterPFXXPath = @"//*[@id='SeasonStats1_dgSeason16_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *pitchTypeHitterPFXNodes = [FGPlayerParser searchWithXPathQuery:pitchTypeHitterPFXXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    StringManipulation *strMan = [[StringManipulation alloc] init];
    
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

        TFHppleElement *fastballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *fastballPercentageString =  [[fastballPercentageElement firstChild]content];
        player.fastballPercentagePFX = [strMan removePercentage:fastballPercentageString];
        NSLog(@"Fastball percentage FX: %@",player.fastballPercentagePFX);
        elementCount++;
        
        TFHppleElement *twoseamPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *twoseamPercentageString =  [[twoseamPercentageElement firstChild]content];
        player.twoseamPercentagePFX = [strMan removePercentage:twoseamPercentageString];
        NSLog(@"Two-Seam percentage FX: %@",player.twoseamPercentagePFX);
        elementCount++;
        
        TFHppleElement *cutterPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *cutterPercentageString =  [[cutterPercentageElement firstChild]content];
        player.cutterPercentagePFX = [strMan removePercentage:cutterPercentageString];
        NSLog(@"Cutter percentage FX: %@",player.cutterPercentagePFX);
        elementCount++;
        
        TFHppleElement *splitFastballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *splitFastballPercentageString =  [[splitFastballPercentageElement firstChild]content];
        player.splitFastballPercentagePFX = [strMan removePercentage:splitFastballPercentageString];
        NSLog(@"Splitter percentage FX: %@",player.splitFastballPercentagePFX);
        elementCount++;
        
        TFHppleElement *forkballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *forkballPercentageString =  [[forkballPercentageElement firstChild]content];
        player.forkballPercentagePFX = [strMan removePercentage:forkballPercentageString];
        NSLog(@"Forkball percentage FX: %@",player.forkballPercentagePFX);
        elementCount++;
        
        TFHppleElement *sinkerPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *sinkerPercentageString =  [[sinkerPercentageElement firstChild]content];
        player.sinkerPercentagePFX = [strMan removePercentage:sinkerPercentageString];
        NSLog(@"Sinker percentage FX: %@",player.sinkerPercentagePFX);
        elementCount++;
        
        TFHppleElement *sliderPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *sliderPercentageString =  [[sliderPercentageElement firstChild]content];
        player.sliderPercentagePFX = [strMan removePercentage:sliderPercentageString];
        NSLog(@"Slider percentage FX: %@",player.sliderPercentagePFX);
        elementCount++;
        
        TFHppleElement *curveballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *curveballPercentageString =  [[curveballPercentageElement firstChild]content];
        player.curveballPercentagePFX = [strMan removePercentage:curveballPercentageString];
        NSLog(@"Curveball percentage FX: %@",player.curveballPercentagePFX);
        elementCount++;
        
        TFHppleElement *knuckleCurveballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *knuckleCurveballPercentageString =  [[knuckleCurveballPercentageElement firstChild]content];
        player.knuckleCurveballPercentagePFX = [strMan removePercentage:knuckleCurveballPercentageString];
        NSLog(@"Knuckle Curve percentage FX: %@",player.knuckleCurveballPercentagePFX);
        elementCount++;
        
        TFHppleElement *lineDrivePercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *lineDrivePercentageString =  [[lineDrivePercentageElement firstChild]content];
        player.ephusPercentagePFX = [strMan removePercentage:lineDrivePercentageString];
        NSLog(@"Ephus percentage FX: %@",player.ephusPercentagePFX);
        elementCount++;
        
        TFHppleElement *changeupPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *changeupPercentageString =  [[changeupPercentageElement firstChild]content];
        player.changeupPercentagePFX = [strMan removePercentage:changeupPercentageString];
        NSLog(@"Changeup percentage FX: %@",player.changeupPercentagePFX);
        elementCount++;
        
        TFHppleElement *screwballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *screwballPercentageString =  [[screwballPercentageElement firstChild]content];
        player.screwballPercentagePFX = [strMan removePercentage:screwballPercentageString];
        NSLog(@"Screwball percentage FX: %@",player.screwballPercentagePFX);
        elementCount++;
        
        TFHppleElement *knuckleballPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *knuckleballPercentageString =  [[knuckleballPercentageElement firstChild]content];
        player.knuckleballPercentagePFX = [strMan removePercentage:knuckleballPercentageString];
        NSLog(@"Knuckleball percentage FX: %@",player.knuckleballPercentagePFX);
        elementCount++;
        
        TFHppleElement *unknownPercentageElement = [pitchTypeHitterPFXNodes objectAtIndex:elementCount];
        NSString *unknownPercentageString =  [[unknownPercentageElement firstChild]content];
        player.unknownPercentagePFX = [strMan removePercentage:unknownPercentageString];
        NSLog(@"Unknown percentage FX: %@",player.unknownPercentagePFX);
        elementCount++;
        
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}

@end
