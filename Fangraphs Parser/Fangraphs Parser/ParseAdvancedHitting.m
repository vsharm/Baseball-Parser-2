//
//  ParseAdvancedHitting.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 9/16/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "ParseAdvancedHitting.h"

@implementation ParseAdvancedHitting
@synthesize webpage;
@synthesize advanced;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    advanced = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* orientationData = [NSDictionary dictionaryWithObject:advanced
                                                                forKey:@"AdvancedHitting"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AdvancedHitting" object:nil userInfo:orientationData];
    });
}

//fill in the relevent data
-(NSArray *)getPlayer{
    
    NSLog(@"IN ADVANCED STATS");
    
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason2_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason2_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *stdHitterXPath = @"//*[@id='SeasonStats1_dgSeason2_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *stdHitterNodes = [FGPlayerParser searchWithXPathQuery:stdHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    for(int i = 0; i< [yearNodes count]; i++){
        int elementCount = (22*i);
        
        Player *player = [[Player alloc] init];
        
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
        
        //Set Games
        TFHppleElement *gamesElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *games = [temp numberFromString:[[gamesElement firstChild]content]];
        player.games = games;
        NSLog(@"Games: %@",player.games);
        elementCount++;
        
        //Set At Bats
        TFHppleElement *abElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *ab = [temp numberFromString:[[abElement firstChild]content]];
        player.atBats = ab;
        NSLog(@"AB: %@",player.atBats);
        elementCount++;
        
        //Set Plate Appearences
        TFHppleElement *paElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *pa = [temp numberFromString:[[paElement firstChild]content]];
        player.plateAppearences = pa;
        NSLog(@"PA: %@",player.plateAppearences);
        elementCount++;
        
        //Set Hits
        TFHppleElement *hitElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *hit = [temp numberFromString:[[hitElement firstChild]content]];
        player.hits = hit;
        NSLog(@"Hits: %@",player.hits);
        elementCount++;
        
        //Set Singles
        TFHppleElement *singleElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *single = [temp numberFromString:[[singleElement firstChild]content]];
        player.singles = single;
        NSLog(@"1B: %@",player.singles);
        elementCount++;
        
        //Set Doubles
        TFHppleElement *doubleElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *doubles = [temp numberFromString:[[doubleElement firstChild]content]];
        player.doubles = doubles;
        NSLog(@"2B: %@",player.doubles);
        elementCount++;
        
        //Set Triples
        TFHppleElement *triplesElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *triples = [temp numberFromString:[[triplesElement firstChild]content]];
        player.triples = triples;
        NSLog(@"3B: %@",player.triples);
        elementCount++;
        
        //Set Homeruns
        TFHppleElement *hrElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *hr = [temp numberFromString:[[hrElement firstChild]content]];
        player.homeruns = hr;
        NSLog(@"HR: %@",player.homeruns);
        elementCount++;
        
        //Set Runs
        TFHppleElement *runsElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *runs = [temp numberFromString:[[runsElement firstChild]content]];
        player.runs = runs;
        NSLog(@"Runs: %@",player.runs);
        elementCount++;
        
        //Set RBI
        TFHppleElement *rbiElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *rbi = [temp numberFromString:[[rbiElement firstChild]content]];
        player.rbi = rbi;
        NSLog(@"RBI: %@",player.rbi);
        elementCount++;
        
        //Set BB
        TFHppleElement *bbElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *bb = [temp numberFromString:[[bbElement firstChild]content]];
        player.baseOnBalls = bb;
        NSLog(@"BB: %@",player.baseOnBalls);
        elementCount++;
        
        //Set IBB
        TFHppleElement *ibbElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *ibb = [temp numberFromString:[[ibbElement firstChild]content]];
        player.intentionalBaseOnBalls = ibb;
        NSLog(@"IBB: %@",player.intentionalBaseOnBalls);
        elementCount++;
        
        //Set so
        TFHppleElement *soElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *so = [temp numberFromString:[[soElement firstChild]content]];
        player.strikeouts = so;
        NSLog(@"SO: %@",player.strikeouts);
        elementCount++;
        
        //Set hbp
        TFHppleElement *hbpElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *hbp = [temp numberFromString:[[hbpElement firstChild]content]];
        player.hitByPitch = hbp;
        NSLog(@"HBP: %@",player.hitByPitch);
        elementCount++;
        
        //Set SF
        TFHppleElement *sfElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *sf = [temp numberFromString:[[sfElement firstChild]content]];
        player.sacrificeFlys = sf;
        NSLog(@"SF: %@",player.sacrificeFlys);
        elementCount++;
        
        //Set SH
        TFHppleElement *shElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *sh = [temp numberFromString:[[shElement firstChild]content]];
        player.sacrificeHits = sh;
        NSLog(@"SH: %@",player.sacrificeHits);
        elementCount++;
        
        [playerArray addObject:player];
    }
    
    
    return playerArray;
}


@end
