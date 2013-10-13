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


@end
