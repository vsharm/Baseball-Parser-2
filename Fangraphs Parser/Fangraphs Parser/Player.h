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

//PFX/Pitch Velocity
@property (nonatomic, copy) NSNumber *fastballVelocity;
@property (nonatomic, copy) NSNumber *twoseamVelocity;
@property (nonatomic, copy) NSNumber *cutterVelocity;
@property (nonatomic, copy) NSNumber *splitFastballVelocity;
@property (nonatomic, copy) NSNumber *sinkerVelocity;
@property (nonatomic, copy) NSNumber *sliderVelocity;
@property (nonatomic, copy) NSNumber *curveballVelocity;
@property (nonatomic, copy) NSNumber *knuckleCurveballVelocity;
@property (nonatomic, copy) NSNumber *forkballVelocity;
@property (nonatomic, copy) NSNumber *ephusVelocity;
@property (nonatomic, copy) NSNumber *changeupVelocity;
@property (nonatomic, copy) NSNumber *screwballVelocity;
@property (nonatomic, copy) NSNumber *knuckleballVelocity;
@property (nonatomic, copy) NSNumber *unknownVelocity;

//Pitch Values
@property (nonatomic, copy) NSNumber *weightedFastball;
@property (nonatomic, copy) NSNumber *weightedSlider;
@property (nonatomic, copy) NSNumber *weightedCutter;
@property (nonatomic, copy) NSNumber *weightedCurveball;
@property (nonatomic, copy) NSNumber *weightedChangeup;
@property (nonatomic, copy) NSNumber *weightedSplitfinger;
@property (nonatomic, copy) NSNumber *weightedKnuckleball;
@property (nonatomic, copy) NSNumber *weightedFastballOver100;
@property (nonatomic, copy) NSNumber *weightedSliderOver100;
@property (nonatomic, copy) NSNumber *weightedCutterOver100;
@property (nonatomic, copy) NSNumber *weightedCurveballOver100;
@property (nonatomic, copy) NSNumber *weightedChangeupOver100;
@property (nonatomic, copy) NSNumber *weightedSplitfingerOver100;
@property (nonatomic, copy) NSNumber *weightedKnuckleballOver100;

//Pitch FX Pitch Value over 100
@property (nonatomic, copy) NSNumber *fastballValueOver100PFX;
@property (nonatomic, copy) NSNumber *twoseamValueOver100PFX;
@property (nonatomic, copy) NSNumber *cutterValueOver100PFX;
@property (nonatomic, copy) NSNumber *splitFastballValueOver100PFX;
@property (nonatomic, copy) NSNumber *sinkerValueOver100PFX;
@property (nonatomic, copy) NSNumber *sliderValueOver100PFX;
@property (nonatomic, copy) NSNumber *curveballValueOver100PFX;
@property (nonatomic, copy) NSNumber *knuckleCurveballValueOver100PFX;
@property (nonatomic, copy) NSNumber *ephusValueOver100PFX;
@property (nonatomic, copy) NSNumber *forkballValueOver100PFX;
@property (nonatomic, copy) NSNumber *changeupValueOver100PFX;
@property (nonatomic, copy) NSNumber *screwballValueOver100PFX;
@property (nonatomic, copy) NSNumber *knuckleballValueOver100PFX;

//Pitch FX Pitch Value
@property (nonatomic, copy) NSNumber *weightedFastballPFX;
@property (nonatomic, copy) NSNumber *weightedTwoseamPFX;
@property (nonatomic, copy) NSNumber *weightedCutterPFX;
@property (nonatomic, copy) NSNumber *weightedSplitFastballPFX;
@property (nonatomic, copy) NSNumber *weightedSinkerPFX;
@property (nonatomic, copy) NSNumber *weightedSliderPFX;
@property (nonatomic, copy) NSNumber *weightedCurveballPFX;
@property (nonatomic, copy) NSNumber *weightedKnuckleCurveballPFX;
@property (nonatomic, copy) NSNumber *weightedEphusPFX;
@property (nonatomic, copy) NSNumber *weightedForkballPFX;
@property (nonatomic, copy) NSNumber *weightedChangeupPFX;
@property (nonatomic, copy) NSNumber *weightedScrewballPFX;
@property (nonatomic, copy) NSNumber *weightedKnuckleballPFX;

//Plate Dicipline
@property (nonatomic, copy) NSNumber *oSwingPercentage;
@property (nonatomic, copy) NSNumber *zSwingPercentage;
@property (nonatomic, copy) NSNumber *swingPercentage;
@property (nonatomic, copy) NSNumber *oContactPercentage;
@property (nonatomic, copy) NSNumber *zContactPercentage;
@property (nonatomic, copy) NSNumber *contactPercentage;
@property (nonatomic, copy) NSNumber *zonePercentage;
@property (nonatomic, copy) NSNumber *fStrikePercentage;
@property (nonatomic, copy) NSNumber *swingingStrikePercentage;


//Pitch FX Plate Dicipline
@property (nonatomic, copy) NSNumber *oSwingPercentagePFX;
@property (nonatomic, copy) NSNumber *zSwingPercentagePFX;
@property (nonatomic, copy) NSNumber *swingPercentagePFX;
@property (nonatomic, copy) NSNumber *oContactPercentagePFX;
@property (nonatomic, copy) NSNumber *zContactPercentagePFX;
@property (nonatomic, copy) NSNumber *contactPercentagePFX;
@property (nonatomic, copy) NSNumber *zonePercentagePFX;
@property (nonatomic, copy) NSNumber *pacePercentagePFX;

//Fielding
//games
@property (nonatomic, copy) NSNumber *gamesStarted;
@property (nonatomic, copy) NSNumber *fieldingInnings;
@property (nonatomic, copy) NSNumber *putOuts;
@property (nonatomic, copy) NSNumber *assists;
@property (nonatomic, copy) NSNumber *errors;
@property (nonatomic, copy) NSNumber *fieldingErrors;
@property (nonatomic, copy) NSNumber *throwingErrors;
@property (nonatomic, copy) NSNumber *doublePlays;
@property (nonatomic, copy) NSNumber *doublePlaysStarted;
@property (nonatomic, copy) NSNumber *doublePlaysTurned;
@property (nonatomic, copy) NSNumber *doublePlaysFinished;
@property (nonatomic, copy) NSNumber *firstBasemenScoops;
@property (nonatomic, copy) NSNumber *stolenBasesCatching;
@property (nonatomic, copy) NSNumber *caughtStealingCatching;
@property (nonatomic, copy) NSNumber *passedBalls;
@property (nonatomic, copy) NSNumber *wildPitches;
@property (nonatomic, copy) NSNumber *fieldingPercentage;
@property (nonatomic, copy) NSNumber *totalZone;


//Advanced Fielding
@property (nonatomic, copy) NSNumber *stolenBaseRunsAboveAvg;
@property (nonatomic, copy) NSNumber *doublePaysRunsAboveAvg;
@property (nonatomic, copy) NSNumber *armRunsAboveAvg;
@property (nonatomic, copy) NSNumber *goodFieldingPlaysRunsAboveAvg;
@property (nonatomic, copy) NSNumber *plusMinusRunsAboveAvg;
@property (nonatomic, copy) NSNumber *defensiveRunsSaved;
@property (nonatomic, copy) NSNumber *ballsInZone;
@property (nonatomic, copy) NSNumber *totalPlaysMade;
@property (nonatomic, copy) NSNumber *revisedZoneRating;
@property (nonatomic, copy) NSNumber *outOfZonePlays;
@property (nonatomic, copy) NSNumber *expectedCatcherPassedPitches;
@property (nonatomic, copy) NSNumber *blockedPitchesRunsAboveAvg;
@property (nonatomic, copy) NSNumber *totalZoneLocationData;
@property (nonatomic, copy) NSNumber *fansScoutingReportRunsAboveAvg;
@property (nonatomic, copy) NSNumber *uzrArmRunsAboveAvg;
@property (nonatomic, copy) NSNumber *uzrDoublePlayRunsAboveAvg;
@property (nonatomic, copy) NSNumber *uzrRangeRunsAboveAvg;
@property (nonatomic, copy) NSNumber *uzrErrorRunsAboveAvg;
@property (nonatomic, copy) NSNumber *uzr;
@property (nonatomic, copy) NSNumber *uzrOver150;

//Value
@property (nonatomic, copy) NSNumber *batting;
@property (nonatomic, copy) NSNumber *baseRunning;
@property (nonatomic, copy) NSNumber *fielding;
@property (nonatomic, copy) NSNumber *positional;
@property (nonatomic, copy) NSNumber *offense;
@property (nonatomic, copy) NSNumber *defense;
@property (nonatomic, copy) NSNumber *league;
@property (nonatomic, copy) NSNumber *replacement;
@property (nonatomic, copy) NSNumber *runsAboveReplacement;
@property (nonatomic, copy) NSNumber *winsAboveReplacement;
@property (nonatomic, copy) NSNumber *dollars;
@property (nonatomic, copy) NSNumber *salary;

@end
