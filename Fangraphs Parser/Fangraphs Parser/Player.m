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













@end
