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

//batttedball
@property (nonatomic, copy) NSNumber *groundballToFlyballRatio;
@property (nonatomic, copy) NSNumber *lineDrivePercentage;
@property (nonatomic, copy) NSNumber *groundballPercentage;
@property (nonatomic, copy) NSNumber *flyballPercentage;
@property (nonatomic, copy) NSNumber *infieldFlyballPercentage;
@property (nonatomic, copy) NSNumber *homerunToFlyballRatio;
@property (nonatomic, copy) NSNumber *infieldHitPercentage;
@property (nonatomic, copy) NSNumber *buntHitPercentage;

//More Batted Ball
@property (nonatomic, copy) NSNumber *groundball;
@property (nonatomic, copy) NSNumber *flyball;
@property (nonatomic, copy) NSNumber *linedrive;
@property (nonatomic, copy) NSNumber *infieldFlyball;
@property (nonatomic, copy) NSNumber *infieldHit;
@property (nonatomic, copy) NSNumber *bunt;
@property (nonatomic, copy) NSNumber *bunthit;
@property (nonatomic, copy) NSNumber *balls;
@property (nonatomic, copy) NSNumber *strikes;
@property (nonatomic, copy) NSNumber *pitches;

//Win Probability Added
@property (nonatomic, copy) NSNumber *winProbabilityAdded;
@property (nonatomic, copy) NSNumber *negativeWinProbability;
@property (nonatomic, copy) NSNumber *positiveWinProbability;
@property (nonatomic, copy) NSNumber *runsAboveAverage24;
@property (nonatomic, copy) NSNumber *runsAboveAverageWins;
@property (nonatomic, copy) NSNumber *pLeverageIndex;
@property (nonatomic, copy) NSNumber *pinchHitLeverageIndex;
@property (nonatomic, copy) NSNumber *pinchHit;
@property (nonatomic, copy) NSNumber *winProbabilityOverLeverageIndex;
@property (nonatomic, copy) NSNumber *clutch;

//Pitch Type FX
@property (nonatomic, copy) NSNumber *fastballPercentagePFX;
@property (nonatomic, copy) NSNumber *twoseamPercentagePFX;
@property (nonatomic, copy) NSNumber *cutterPercentagePFX;
@property (nonatomic, copy) NSNumber *splitFastballPercentagePFX;
@property (nonatomic, copy) NSNumber *sinkerPercentagePFX;
@property (nonatomic, copy) NSNumber *sliderPercentagePFX;
@property (nonatomic, copy) NSNumber *curveballPercentagePFX;
@property (nonatomic, copy) NSNumber *knuckleCurveballPercentagePFX;
@property (nonatomic, copy) NSNumber *ephusPercentagePFX;
@property (nonatomic, copy) NSNumber *forkballPercentagePFX;
@property (nonatomic, copy) NSNumber *changeupPercentagePFX;
@property (nonatomic, copy) NSNumber *screwballPercentagePFX;
@property (nonatomic, copy) NSNumber *knuckleballPercentagePFX;
@property (nonatomic, copy) NSNumber *unknownPercentagePFX;

//Pitch Type
@property (nonatomic, copy) NSNumber *fastballPercentage;
@property (nonatomic, copy) NSNumber *sliderPercentage;
@property (nonatomic, copy) NSNumber *cutterPercentage;
@property (nonatomic, copy) NSNumber *curveBallPercentage;
@property (nonatomic, copy) NSNumber *changeupPercentage;
@property (nonatomic, copy) NSNumber *splitfingerPercentage;
@property (nonatomic, copy) NSNumber *knuckleballPercentage;
@property (nonatomic, copy) NSNumber *unknownPercentage;





@end
