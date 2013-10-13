//
//  MasterParser.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 5/29/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//


#import <Foundation/Foundation.h>

@class Player;
@class TFHpple;

@interface MasterParser : NSObject
{
	NSOperationQueue *queue;
	NSMutableArray *playerPages;
	NSURL  *FGPlayerUrl;
	NSData *FGPlayerPage;
	TFHpple *FGPlayerParser;
}

@property (nonatomic, copy) NSMutableArray *playerArray;

-(void)setWebPages;
-(NSUInteger)getNumYears;
-(NSArray *)getPlayer;
-(BOOL) isDuplicate;
-(NSArray*) getDuplicateLinks;
-(Player *) getYearOfPlayer : (int)countOfPlayersYearInLeague;
-(void) getAllPlayerCatagories;
//URL Getters and Setters
-(void) setURL:(NSString *) name;
-(NSURL *) getFGURL;

@end
