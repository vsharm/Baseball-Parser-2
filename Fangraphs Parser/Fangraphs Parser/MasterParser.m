//
//  MasterParser.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 5/29/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "MasterParser.h"
#import "LoadPage.h"
#import "TFHpple.h"
#import "Player.h"
#import "HTMLNode.h"
#import "HTMLParser.h"
#import "DuplicateType.h"
#import "ParseStandardHitting.h"
#import "ParseAdvancedHitting.h"
#import "PlayerInfoAndPosition.h"
#import "ParseBattedBall.h"
#import "ParseMoreBattedBall.h"
#import "ParseWinProbability.h"
#import "ParsePitchType.h"
#import "ParsePitchFXPitchType.h"
#import "ParseFielding.h"
#import "ParseAdvancedFielding.h"
#import "ParsePitchFXPitchVelocity.h"
#import "ParsePitchValues.h"
#import "ParsePitchFXPitchValues.h"


@implementation MasterParser


-(void)setWebPages
{
	LoadPage *FGpage = [[LoadPage alloc] initWithURL:FGPlayerUrl];
    queue = [[NSOperationQueue alloc] init];

	[queue addOperation:FGpage];
	[queue waitUntilAllOperationsAreFinished];
	FGPlayerPage = [FGpage webpage];
	FGPlayerParser = [TFHpple hppleWithHTMLData:FGPlayerPage];
	
}


-(void) setURL:(NSString *) name
{
	name = [name stringByReplacingOccurrencesOfString:@" " withString:@"+"];
	
	//Fangraphs Load
	NSString *FGstarter = @"http://www.fangraphs.com/players.aspx?lastname=";
	NSString *FGquery =  [FGstarter stringByAppendingString:name];
	NSLog(@"%@",FGquery);
	FGPlayerUrl = [NSURL URLWithString:FGquery];
}

-(NSURL *) getFGURL{
	return FGPlayerUrl;
}

-(NSUInteger)getNumYears{
    NSString *yearsXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearsXpath];
    NSUInteger numYears = [yearNodes count];
	@try {
       if(!(numYears > 0))
           @throw [NSException exceptionWithName:@"0 Years Played" reason:@"Player Does not Exist or Bad XPath" userInfo:nil];
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR 0 YEARS");
    }
    NSLog(@"Years are %lu", (unsigned long)numYears);
	return numYears;
}

-(BOOL) isDuplicate{
    //Query the season tab
    NSString *duplicateXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/thead/tr/th[1]";
    NSArray *duplicateNode = [FGPlayerParser searchWithXPathQuery:duplicateXpath];
    
    //Exit if there are no duplicates
    if ([duplicateNode count] != 0){
        TFHppleElement *duplicateElement = [duplicateNode objectAtIndex:0];
        NSString *duplicate = [[duplicateElement firstChild] content];
        if([duplicate isEqualToString:@"Season"])
            return FALSE;
    }
    return TRUE;
}

-(NSArray*) getDuplicateLinks{
    
    //Set up the parser
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithData:FGPlayerPage error:&error];
    HTMLNode *bodyNode = [parser body];
    
    //Find all player links (all with statss in the href)
    NSArray *potentialDuplicateNodes = [bodyNode findChildrenWithAttribute:@"href" matchingName:@"statss" allowPartial:TRUE];
    
    //Data to be returned
    NSMutableArray *duplicateNodes = [[NSMutableArray alloc] initWithCapacity:0];
    
    //Set up temporary Data
    DuplicateType *temp = [[DuplicateType alloc] init];
    
    //Loop through the potential Duplicate links and find the real duplicates
    for(HTMLNode *a in potentialDuplicateNodes){
        
        //If the first character of the nodes attribute is not a / then we know we found a duplicate
        if ([[a getAttributeNamed:@"href"] characterAtIndex:0] != '/'){
            
            //Grab the link of the duplicate
            temp.url = [NSURL URLWithString:[a getAttributeNamed:@"href"] relativeToURL:[NSURL URLWithString:@"http://www.fangraphs.com/"]];
            
            //set up temporary array to hold notes found in the findtags search below. The search below
            //searches with the data associated with the each duplicate player
            NSArray *tempArray = [[NSMutableArray alloc] initWithArray:[[[a parent] parent] findChildTags:@"td"]];
           
            //do a try catch incase the tempArray is empty
            @try
            {
                //Set the duplicate data data type
                temp.duration = [[tempArray objectAtIndex:2] contents];
                temp.position = [[tempArray objectAtIndex:3] contents];
                
            }
            @catch (NSException *exception)
            {
                NSLog(@"ERROR 0 Data for Duplicates");
            }
            
            //Add the temp object to the array
            [duplicateNodes addObject:temp];
            
            //Output all the data found
            NSLog(@"%@", [temp.url absoluteString]);
            NSLog(@"%@", temp.duration);
            NSLog(@"%@", temp.duration);
        }
    }
    
    //Return the duplicate Nodes
    return [[NSArray alloc] initWithArray:duplicateNodes];

}

-(void) getAllPlayerCatagories{
    ParseStandardHitting *standard = [[ParseStandardHitting alloc] initWithWebpage:FGPlayerPage];
    PlayerInfoAndPosition *playerInfo = [[PlayerInfoAndPosition alloc] initWithWebpage:FGPlayerPage];
    ParseAdvancedHitting *advanced = [[ParseAdvancedHitting alloc] initWithWebpage:FGPlayerPage];
    ParseBattedBall *battedBall = [[ParseBattedBall alloc] initWithWebpage:FGPlayerPage];
    ParseMoreBattedBall *moreBattedBall = [[ParseMoreBattedBall alloc] initWithWebpage:FGPlayerPage];
    ParseWinProbability *winProbability = [[ParseWinProbability alloc] initWithWebpage:FGPlayerPage];
    ParsePitchType *pitchType = [[ParsePitchType alloc] initWithWebpage:FGPlayerPage];
    ParsePitchFXPitchType *pitchTypeFX = [[ParsePitchFXPitchType alloc] initWithWebpage:FGPlayerPage];
    ParseFielding *fielding = [[ParseFielding alloc] initWithWebpage:FGPlayerPage];
    ParseAdvancedFielding *advancedFielding = [[ParseAdvancedFielding alloc] initWithWebpage:FGPlayerPage];
    ParsePitchFXPitchVelocity *pitchVelocity = [[ParsePitchFXPitchVelocity alloc] initWithWebpage:FGPlayerPage];
    ParsePitchValues *pitchValues = [[ParsePitchValues alloc] initWithWebpage:FGPlayerPage];
    ParsePitchFXPitchValues *pitchFXValues = [[ParsePitchFXPitchValues alloc] initWithWebpage:FGPlayerPage];


    [queue addOperation:standard];
    [queue addOperation:playerInfo];
    [queue addOperation:advanced];
    [queue addOperation:battedBall];
    [queue addOperation:moreBattedBall];
    [queue addOperation:winProbability];
    [queue addOperation:pitchType];
    [queue addOperation:pitchTypeFX];
    [queue addOperation:fielding];
    [queue addOperation:advancedFielding];
    [queue addOperation:pitchVelocity];
    [queue addOperation:pitchValues];
    [queue addOperation:pitchFXValues];
    [queue waitUntilAllOperationsAreFinished];
}

-(Player *) getYearOfPlayer : (int)countOfPlayersYearInLeague{
    //Years Xpath
    
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *stdHitterXPath = @"//*[@id='SeasonStats1_dgSeason1_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
    NSArray *stdHitterNodes = [FGPlayerParser searchWithXPathQuery:stdHitterXPath];
    
    
    
    //Temp Vars for changing NSString to NSNumber
    NSNumberFormatter *temp = [[NSNumberFormatter alloc] init];
    [temp setNumberStyle:NSNumberFormatterDecimalStyle];
    
    
    
    int elementCount = (22* countOfPlayersYearInLeague);
    
    Player *player = [[Player alloc] init];
        
    //Set Year
    TFHppleElement *yearElement = [yearNodes objectAtIndex:countOfPlayersYearInLeague];
    NSString *year = [[yearElement firstChild]content];
    player.year = year;
    NSLog(@"Year: %@",player.year);
    elementCount++;
        
    //Set Team
    TFHppleElement *teamElement = [teamNodes objectAtIndex:countOfPlayersYearInLeague];
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
        
    //Set GDP
    TFHppleElement *gdpElement = [stdHitterNodes objectAtIndex:elementCount];
    NSNumber *gdp = [temp numberFromString:[[gdpElement firstChild]content]];
    player.groundIntoDoublePlays = gdp;
    NSLog(@"GDP: %@",player.groundIntoDoublePlays);
    elementCount++;
        
    //Set SB
    TFHppleElement *sbElement = [stdHitterNodes objectAtIndex:elementCount];
    NSNumber *sb = [temp numberFromString:[[sbElement firstChild]content]];
    player.stolenBases = sb;
    NSLog(@"SB: %@",player.stolenBases);
    elementCount++;
        
    //Set CS
    TFHppleElement *csElement = [stdHitterNodes objectAtIndex:elementCount];
    NSNumber *cs = [temp numberFromString:[[csElement firstChild]content]];
    player.caughtStolen = cs;
    NSLog(@"SB: %@",player.caughtStolen);
    elementCount++;
        
    //Set AVG
    TFHppleElement *avgElement = [stdHitterNodes objectAtIndex:elementCount];
    NSNumber *avg = [temp numberFromString:[[avgElement firstChild]content]];
    player.average = avg;
    NSLog(@"AVG: %@",player.average);
    elementCount++;
        
    return player;
    
    
}


-(NSArray *)getPlayer{

    //Years Xpath
    NSString *yearXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[1]/a";
    NSArray *yearNodes = [FGPlayerParser searchWithXPathQuery:yearXpath];
    
    //Team Xpath
    NSString *teamXpath = @"//*[@id='SeasonStats1_dgSeason11_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td[2]/a";
    NSArray *teamNodes = [FGPlayerParser searchWithXPathQuery:teamXpath];
    
    
    //Table Xpath
    NSString *stdHitterXPath = @"//*[@id='SeasonStats1_dgSeason1_ctl00']/tbody/tr[@class='rgRow' or @class='rgAltRow']/td";
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
       
        //Set GDP
        TFHppleElement *gdpElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *gdp = [temp numberFromString:[[gdpElement firstChild]content]];
        player.groundIntoDoublePlays = gdp;
        NSLog(@"GDP: %@",player.groundIntoDoublePlays);
        elementCount++;
        
        //Set SB
        TFHppleElement *sbElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *sb = [temp numberFromString:[[sbElement firstChild]content]];
        player.stolenBases = sb;
        NSLog(@"SB: %@",player.stolenBases);
        elementCount++;
        
        //Set CS
        TFHppleElement *csElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *cs = [temp numberFromString:[[csElement firstChild]content]];
        player.caughtStolen = cs;
        NSLog(@"SB: %@",player.caughtStolen);
        elementCount++;
        
        //Set AVG
        TFHppleElement *avgElement = [stdHitterNodes objectAtIndex:elementCount];
        NSNumber *avg = [temp numberFromString:[[avgElement firstChild]content]];
        player.average = avg;
        NSLog(@"AVG: %@",player.average);
        elementCount++;
        
        [playerArray addObject:player];
    }
        
    
    return yearNodes;
}



@end
