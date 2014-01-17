//
//  Player.m
//  Fangraphs Parser
//
//  Created by Varun Sharma on 6/5/13.
//  Copyright (c) 2013 Varun Sharma. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize contract_current = _contract_current;

//Player Stats
@synthesize year = _year;
@synthesize team = _team;
@synthesize playerPosition = _playerPosition;
@synthesize games = _games;
@synthesize yearsPlayed = _yearsPlayed;


//Standard Hitting Stats
@synthesize atBats = _atBats;
@synthesize hits = _hits;
@synthesize doubles = _doubles;
@synthesize triples = _triples;
@synthesize homeruns = _homeruns;
@synthesize runs = _runs;
@synthesize rbi = _rbi;
@synthesize baseOnBalls = _baseOnBalls;
@synthesize intentionalBaseOnBalls = _intentionalBaseOnBalls;
@synthesize strikeouts = _strikeouts;
@synthesize hitByPitch = _hitByPitch;
@synthesize sacrificeFlys = _sacrificeFlys;
@synthesize sacrificeHits = _sacrificeHits;
@synthesize groundIntoDoublePlays = _groundIntoDoublePlays;
@synthesize stolenBases = _stolenBases;
@synthesize caughtStolen = _caughtStolen;
@synthesize average = _average;

//advanced Hitting Stats
@synthesize baseOnBallPercentage = _baseOnBallPercentage;
@synthesize strikeoutPercentage = _strikeoutPercentage;
@synthesize walkToStrikeoutRatio = _walkToStrikeoutRatio;
@synthesize onBasePercentage = _onBasePercentage;
@synthesize sluggingPercentage = _sluggingPercentage;
@synthesize onBasePlusSlugging = _onBasePlusSlugging;
@synthesize isolatedSlugging = _isolatedSlugging;
@synthesize speed = _speed;
@synthesize babip = _babip;
@synthesize ubr = _ubr;
@synthesize wSB = _wSB;
@synthesize wRC = _wRC;
@synthesize wRAA = _wRAA;
@synthesize wOBA = _wOBA;
@synthesize wRCPlus = _wRCPlus;

//battedball
@synthesize groundballToFlyballRatio = _groundballToFlyballRatio;
@synthesize lineDrivePercentage = _lineDrivePercentage;
@synthesize groundballPercentage = _groundballPercentage;
@synthesize flyballPercentage = _flyballPercentage;
@synthesize infieldFlyballPercentage = _infieldFlyballPercentage;
@synthesize homerunToFlyballRatio = _homerunToFlyballRatio;
@synthesize infieldHitPercentage = _infieldHitPercentage;
@synthesize buntHitPercentage = _buntHitPercentage;

//More Batted Ball
@synthesize groundball = _groundball;
@synthesize flyball = _flyball;
@synthesize linedrive = _linedrive;
@synthesize infieldFlyball = _infieldFlyball;
@synthesize infieldHit = _infieldHit;
@synthesize bunt = _bunt;
@synthesize bunthit = _bunthit;
@synthesize balls = _balls;
@synthesize strikes = _strikes;
@synthesize pitches = _pitches;

//Win Probability Added

@synthesize winProbabilityAdded = _winProbabilityAdded;
@synthesize negativeWinProbability = _negativeWinProbability;
@synthesize positiveWinProbability = _positiveWinProbability;
@synthesize runsAboveAverage24 = _runsAboveAverage24;
@synthesize runsAboveAverageWins = _runsAboveAverageWins;
@synthesize pLeverageIndex = _pLeverageIndex;
@synthesize pinchHitLeverageIndex = _pinchHitLeverageIndex;
@synthesize pinchHit = _pinchHit;
@synthesize winProbabilityOverLeverageIndex = _winProbabilityOverLeverageIndex;
@synthesize clutch = _clutch;

//PFX Pitch Type
@synthesize fastballPercentagePFX = _fastballPercentagePFX;
@synthesize twoseamPercentagePFX = _twoseamPercentagePFX;
@synthesize cutterPercentagePFX = _cutterPercentagePFX;
@synthesize splitFastballPercentagePFX = _splitFastballPercentagePFX;
@synthesize sinkerPercentagePFX = _sinkerPercentagePFX;
@synthesize sliderPercentagePFX = _sliderPercentagePFXPFX;
@synthesize curveballPercentagePFX = _curveballPercentagePFX;
@synthesize knuckleCurveballPercentagePFX = _knuckleCurveballPercentagePFX;
@synthesize forkballPercentagePFX = _forkballPercentagePFX;
@synthesize ephusPercentagePFX = _ephusPercentagePFX;
@synthesize changeupPercentagePFX = _changeupPercentagePFX;
@synthesize screwballPercentagePFX = _screwballPercentagePFX;
@synthesize knuckleballPercentagePFX = _knuckleballPercentagePFX;
@synthesize unknownPercentagePFX = _unknownPercentagePFX;

//PitchType
@synthesize fastballPercentage = _fastballPercentage;
@synthesize sliderPercentage = _sliderPercentage;
@synthesize cutterPercentage = _cutterPercentage;
@synthesize curveBallPercentage = _curveBallPercentage;
@synthesize changeupPercentage = _changeupPercentage;
@synthesize splitfingerPercentage = _splitfingerPercentage;
@synthesize knuckleballPercentage = _knuckleballPercentage;
@synthesize unknownPercentage = _unknownPercentage;

//Pitch Values
@synthesize weightedFastball = _weightedFastball;
@synthesize weightedSlider = _weightedSlider;
@synthesize weightedCutter = _weightedCutter;
@synthesize weightedCurveball = _weightedCurveball;
@synthesize weightedChangeup = _weightedChangeup;
@synthesize weightedSplitfinger = _weightedSplitfinger;
@synthesize weightedKnuckleball = _weightedKnuckleball;
@synthesize weightedFastballOver100 = _weightedFastballOver100;
@synthesize weightedSliderOver100 = _weightedSliderOver100;
@synthesize weightedCutterOver100 = _weightedCutterOver100;
@synthesize weightedCurveballOver100 = _weightedCurveballOver100;
@synthesize weightedChangeupOver100 = _weightedChangeupOver100;
@synthesize weightedSplitfingerOver100 = _weightedSplitfingerOver100;
@synthesize weightedKnuckleballOver100 = _weightedKnuckleballOver100;

//PITCHf/x Pitch Velocity
@synthesize fastballVelocity = _fastballVelocity;
@synthesize twoseamVelocity = _twoseamVelocity;
@synthesize cutterVelocity = _cutterVelocity;
@synthesize splitFastballVelocity = _splitFastballVelocity;
@synthesize sinkerVelocity = _sinkerVelocity;
@synthesize sliderVelocity = _sliderVelocity;
@synthesize curveballVelocity = _curveballVelocity;
@synthesize knuckleCurveballVelocity = _knuckleCurveballVelocity;
@synthesize forkballVelocity = _forkballVelocity;
@synthesize ephusVelocity = _ephusVelocity;
@synthesize changeupVelocity = _changeupVelocity;
@synthesize screwballVelocity = _screwballVelocity;
@synthesize knuckleballVelocity = _knuckleballVelocity;
@synthesize unknownVelocity = _unknownVelocity;

//Pate Dicipline
@synthesize oSwingPercentage = _oSwingPercentage;
@synthesize zSwingPercentage = _zSwingPercentage;
@synthesize swingPercentage = _swingPercentage;
@synthesize oContactPercentage = _oContactPercentage;
@synthesize zContactPercentage = _zContactPercentage;
@synthesize contactPercentage = _contactPercentage;
@synthesize zonePercentage = _zonePercentage;
@synthesize fStrikePercentage = _fStrikePercentage;
@synthesize swingingStrikePercentage = _swingingStrikePercentage;

//Pitch FX Plate Dicipline
@synthesize oSwingPercentagePFX = _oSwingPercentagePFX;
@synthesize zSwingPercentagePFX = _zSwingPercentagePFX;
@synthesize swingPercentagePFX = _swingPercentagePFX;
@synthesize oContactPercentagePFX = _oContactPercentagePFX;
@synthesize zContactPercentagePFX = _zContactPercentagePFX;
@synthesize contactPercentagePFX = _contactPercentagePFX;
@synthesize zonePercentagePFX = _zonePercentagePFX;
@synthesize pacePercentagePFX = _pacePercentagePFX;

//Pitch FX Pitch Value Over 100
@synthesize fastballValueOver100PFX = _fastballValueOver100PFX;
@synthesize twoseamValueOver100PFX = _twoseamValueOver100PFX;
@synthesize cutterValueOver100PFX = _cutterValueOver100PFX;
@synthesize splitFastballValueOver100PFX = _splitFastballValueOver100PFX;
@synthesize sinkerValueOver100PFX = _sinkerValueOver100PFX;
@synthesize sliderValueOver100PFX = _sliderValueOver100PFX;
@synthesize curveballValueOver100PFX = _curveballValueOver100PFX;
@synthesize knuckleCurveballValueOver100PFX = _knuckleCurveballValueOver100PFX;
@synthesize ephusValueOver100PFX = _ephusValueOver100PFX;
@synthesize forkballValueOver100PFX = _forkballValueOver100PFX;
@synthesize changeupValueOver100PFX = _changeupValueOver100PFX;
@synthesize screwballValueOver100PFX = _screwballValueOver100PFX;
@synthesize knuckleballValueOver100PFX = _knuckleballValueOver100PFX;

//

//Fielding
//games
@synthesize gamesStarted = _gamesStarted;
@synthesize fieldingInnings = _fieldingInnings;
@synthesize putOuts = _putOuts;
@synthesize assists = _assists;
@synthesize errors = _errors;
@synthesize fieldingErrors = _fieldingErrors;
@synthesize throwingErrors = _throwingErrors;
@synthesize doublePlays = _doublePlays;
@synthesize doublePlaysStarted = _doublePlaysStarted;
@synthesize doublePlaysTurned = _doublePlaysTurned;
@synthesize doublePlaysFinished = _doublePlaysFinished;
@synthesize firstBasemenScoops = _firstBasemenScoops;
@synthesize stolenBasesCatching = _stolenBasesCatching;
@synthesize caughtStealingCatching = _caughtStealingCatching;
@synthesize passedBalls = _passedBalls;
@synthesize wildPitches = _wildPitches;
@synthesize fieldingPercentage = _fieldingPercentage;
@synthesize totalZone = _totalZone;

//Advanced Fielding

//innigns
@synthesize stolenBaseRunsAboveAvg = _stolenBaseRunsAboveAvgFB;
@synthesize doublePaysRunsAboveAvg = _doublePaysRunsAboveAvgFB;
@synthesize armRunsAboveAvg = _armRunsAboveAvg;
@synthesize goodFieldingPlaysRunsAboveAvg = _goodFieldingPlaysRunsAboveAvgFB;
@synthesize plusMinusRunsAboveAvg = _plusMinusRunsAboveAvgFB;
@synthesize defensiveRunsSaved = _defensiveRunsSavedFB;
@synthesize ballsInZone = _ballsInZone;
@synthesize totalPlaysMade = _totalPlaysMade;
@synthesize revisedZoneRating = _revisedZoneRating;
@synthesize outOfZonePlays = _outOfZonePlays;
@synthesize expectedCatcherPassedPitches = _expectedCatcherPassedPitches;
@synthesize blockedPitchesRunsAboveAvg = _blockedPitchesRunsAboveAvg;
@synthesize totalZoneLocationData = _totalZoneLocationData;
@synthesize fansScoutingReportRunsAboveAvg = _fansScoutingReportRunsAboveAvg;
@synthesize uzrArmRunsAboveAvg = _uzrArmRunsAboveAvg;
@synthesize uzrDoublePlayRunsAboveAvg = _uzrDoublePlayRunsAboveAvg;
@synthesize uzrRangeRunsAboveAvg = _uzrRangeRunsAboveAvg;
@synthesize uzrErrorRunsAboveAvg = _uzrErrorRunsAboveAvg;
@synthesize uzr = _uzr;
@synthesize uzrOver150 = _uzrOver150;

//Pitch FX Pitch Value
@synthesize weightedFastballPFX = _weightedFastballPFX;
@synthesize weightedTwoseamPFX = _weightedTwoseamPFX;
@synthesize weightedCutterPFX = _weightedCutterPFX;
@synthesize weightedSplitFastballPFX = _weightedSplitFastballPFX;
@synthesize weightedSinkerPFX = _weightedSinkerPFX;
@synthesize weightedSliderPFX = _weightedSliderPFX;
@synthesize weightedCurveballPFX = _weightedCurveballPFX;
@synthesize weightedKnuckleCurveballPFX = _weightedKnuckleCurveballPFX;
@synthesize weightedEphusPFX = _weightedEphusPFX;
@synthesize weightedForkballPFX = _weightedForkballPFX;
@synthesize weightedChangeupPFX = _weightedChangeupPFX;
@synthesize weightedScrewballPFX = _weightedScrewballPFX;
@synthesize weightedKnuckleballPFX = _weightedKnuckleballPFX;

//Value

@synthesize batting = _batting;
@synthesize baseRunning = _baseRunning;
@synthesize fielding = _fielding;
@synthesize positional = _positional;
@synthesize offense = _offense;
@synthesize defense = _defense;
@synthesize league = _league;
@synthesize replacement = _replacement;
@synthesize runsAboveReplacement = _runsAboveReplacement;
@synthesize winsAboveReplacement = _winsAboveReplacement;
@synthesize dollars = _dollars;
@synthesize salary = _salary;



@end
