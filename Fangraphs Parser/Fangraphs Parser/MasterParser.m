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
#import "ParsePitchFXPitchValuesOver100.h"
#import "ParsePlateDiscipline.h"
#import "ParsePlateDisciplinePitchFX.h"
#import "ParseFansScoutingReport.h"
#import "ParseValue.h"

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
    ParsePitchFXPitchValuesOver100 *pitchFXValuesOver100 = [[ParsePitchFXPitchValuesOver100 alloc] initWithWebpage:FGPlayerPage];
    ParsePlateDiscipline *plateDiscipline = [[ParsePlateDiscipline alloc] initWithWebpage:FGPlayerPage];
    ParsePlateDisciplinePitchFX *plateDisciplinePitchFX = [[ParsePlateDisciplinePitchFX alloc] initWithWebpage:FGPlayerPage];
    ParseFansScoutingReport *fansScoutingReport = [[ParseFansScoutingReport alloc] initWithWebpage:FGPlayerPage];
    ParseValue *parseValue = [[ParseValue alloc] initWithWebpage:FGPlayerPage];

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
    [queue addOperation:pitchFXValuesOver100];
    [queue addOperation:plateDiscipline];
    [queue addOperation:plateDisciplinePitchFX];
    [queue addOperation:fansScoutingReport];
    [queue addOperation:parseValue];
    [queue waitUntilAllOperationsAreFinished];
}

@end
