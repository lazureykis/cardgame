//
//  PlayingCardDeck.m
//  Matchizmo
//
//  Created by Павел Лазурейкис on 23/01/14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for(NSUInteger rank=1; rank <= [PlayingCard maxRank]; rank ++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end