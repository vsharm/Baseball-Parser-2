//
//  PlayerInfoAndPosition.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 7/29/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "PlayerInfoAndPosition.h"

@implementation PlayerInfoAndPosition
@synthesize webpage;
@synthesize playerInfoData;


- (id)initWithWebpage:(NSData*)webpageData{
    self = [super init];
    [self setWebpage:webpageData];
    return self;
}
- (void)main {
    FGPlayerParser = [[TFHpple alloc] initWithHTMLData:webpage];
    playerInfoData = [[NSArray alloc] initWithArray:[self getPlayer]];
    
    //Post Notification
    NSDictionary* PlayerInfoStats = [NSDictionary dictionaryWithObject:playerInfoData                                                   forKey:@"PlayerInfoStats"];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PlayerInfoStats" object:nil userInfo:PlayerInfoStats];
    });
}


-(NSArray *)getPlayer{
    
    Player *playerInfo  = [Player new];
    
    
    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    playerInfo.yearsPlayed =[NSNumber numberWithInt:[yearNodes count]]; 
    NSLog(@"Years Played: %@" , playerInfo.yearsPlayed);
    
    
    //Current Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    TFHppleElement *teamElement = [teamNodes objectAtIndex:0];
    playerInfo.team = [[teamElement firstChild]content];
    NSLog(@"Current Team: %@" , playerInfo.team);

    
    //Name Xpath
    NSString *nameXpath = @"//*[@id='Head1']/title";
    NSArray *nameNodes = [FGPlayerParser searchWithXPathQuery:nameXpath];
    TFHppleElement *nameElement = [nameNodes objectAtIndex:0];
    //Name contains alot of junk in the format of Name:\n Brandon Crawford » Statistics » Batting | FanGraphs Baseball
    NSString *formattingName = [[nameElement firstChild]content];
    formattingName = [formattingName substringFromIndex: 3];                     //trim the front of the string
    NSUInteger cuttoffPoint = [formattingName  rangeOfString:@"»"].location -1;  //trim the end of the string
    formattingName = [formattingName substringToIndex:  cuttoffPoint];
    playerInfo.name = formattingName;
    NSLog(@"Name: %@" , playerInfo.name);
    
    //The strategy for finding a position goes like this
    
    //The way fangraphs has its tables is that in the years column a "total" appears for everythign a person has done
    //at that position so this loop goes through all the years and adds all the row indexes of each total
    //this is so we only grab 1 position per position played. So 1st base does not show up twice
    
    //Find all the total years
    NSMutableArray *totalYears = [NSMutableArray new];
    NSString *seasonalPositionXpath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr/td[1]/a";
    NSArray *seasonalPositionNodes = [FGPlayerParser searchWithXPathQuery:seasonalPositionXpath];
    int number = 0;
    for (TFHppleElement *currentYear in seasonalPositionNodes){
        //select only the years that have total and apend the their rows signified by the count to the array totalyears
        if( [[[currentYear firstChild]content] isEqualToString:@"Total"] ){
            [totalYears addObject:[NSNumber numberWithInt:number]];
        }
        number++;
    }
    
    //The position string
    playerInfo.playerPosition = @"";
    
    //Get all the innings of that player to make sure that player has not played an insignificant amount of time at that pos
    NSString *inningsXpath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr/td[6]";
    NSArray *innings = [FGPlayerParser searchWithXPathQuery:inningsXpath];
    
    //Get all positions played column
    NSString *positionXpath = @"//*[@id='SeasonStats1_dgSeason8_ctl00']/tbody/tr/td[3]/a";
    NSArray *thisPosition = [FGPlayerParser searchWithXPathQuery:positionXpath];
    
    //Now loop through specialized
    for(NSNumber *position in totalYears){
        //if the person has more than one position make sure that he has played that position for more than 100 innings
        if( ([thisPosition count] > 1) && [[[[innings objectAtIndex:[position intValue]] firstChild] content] intValue] > 100){
            NSString *positionString = [[[thisPosition objectAtIndex:[position intValue]] firstChild] content];
            NSLog(@"Position: %@",positionString);
            playerInfo.playerPosition = [playerInfo.playerPosition stringByAppendingString:positionString];
            playerInfo.playerPosition = [playerInfo.playerPosition stringByAppendingString:@", "];
        }
        //this person has only played one position soe it must be right
        else{
            NSString *positionString = [[[thisPosition objectAtIndex:[position intValue]] firstChild] content];
            NSLog(@"Position: %@",positionString);
            playerInfo.playerPosition = [playerInfo.playerPosition stringByAppendingString:positionString];
        }
    }
    
    //Create Temporary array to return
    return [[NSArray alloc] initWithObjects:&playerInfo count:1];
}


@end
