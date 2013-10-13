//
//  Player.h
//  Fangraphs Parser
//
//  Created by Varun Sharma on 6/5/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

//Player info Stats
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *team;
@property (nonatomic, copy) NSString *playerPosition;
@property (nonatomic, copy) NSNumber *yearsPlayed;
@property (nonatomic, copy) NSString *contract_current;

//Catch All Standard
@property (nonatomic, copy) NSNumber *games;


//Standard Hitting Stats

@property (nonatomic, copy) NSNumber *atBats;
@property (nonatomic, copy) NSNumber *plateAppearences;
@property (nonatomic, copy) NSNumber *hits;
@property (nonatomic, copy) NSNumber *singles;
@property (nonatomic, copy) NSNumber *doubles;
@property (nonatomic, copy) NSNumber *triples;
@property (nonatomic, copy) NSNumber *homeruns;
@property (nonatomic, copy) NSNumber *runs;
@property (nonatomic, copy) NSNumber *rbi;
@property (nonatomic, copy) NSNumber *baseOnBalls;
@property (nonatomic, copy) NSNumber *intentionalBaseOnBalls;
@property (nonatomic, copy) NSNumber *strikeouts;
@property (nonatomic, copy) NSNumber *hitByPitch;
@property (nonatomic, copy) NSNumber *sacrificeFlys;
@property (nonatomic, copy) NSNumber *sacrificeHits;
@property (nonatomic, copy) NSNumber *groundIntoDoublePlays;
@property (nonatomic, copy) NSNumber *stolenBases;
@property (nonatomic, copy) NSNumber *caughtStolen;
@property (nonatomic, copy) NSNumber *average;

//advanced Hitting Stats
@property (nonatomic, copy) NSNumber *baseOnBallPercentage;
@property (nonatomic, copy) NSNumber *strikeoutPercentage;
@property (nonatomic, copy) NSNumber *walkToStrikeoutRatio;
@property (nonatomic, copy) NSNumber *onBasePercentage;
@property (nonatomic, copy) NSNumber *sluggingPercentage;
@property (nonatomic, copy) NSNumber *onBasePlusSlugging;
@property (nonatomic, copy) NSNumber *isolatedSlugging;
@property (nonatomic, copy) NSNumber *speed;
@property (nonatomic, copy) NSNumber *babip;
@property (nonatomic, copy) NSNumber *ubr;
@property (nonatomic, copy) NSNumber *wSB;
@property (nonatomic, copy) NSNumber *wRC;
@property (nonatomic, copy) NSNumber *wRAA;
@property (nonatomic, copy) NSNumber *wOBA;
@property (nonatomic, copy) NSNumber *wRCPlus;

//Pitching Stats

@end
