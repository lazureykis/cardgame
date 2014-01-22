//
//  PlayingCard.m
//  Matchizmo
//
//  Created by Павел Лазурейкис on 23.01.14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
@synthesize rank = _rank;

-(NSString*)contents
{
    NSArray *rankStrings = @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(void)setSuit:(NSString *)suit
{
    if ([@[@"♠️", @"♥️", @"♣️", @"♦️"] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString*)suit
{
    return _suit ? _suit : @"?";
}

@end
