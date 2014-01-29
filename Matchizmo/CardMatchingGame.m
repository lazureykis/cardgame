//
//  CardMatchingGame.m
//  Matchizmo
//
//  Created by Павел Лазурейкис on 23/01/14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) BOOL started;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

@synthesize started = _started;

-(NSMutableArray*)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)init
{
    return nil;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(BOOL)isStarted
{
    return _started;
}

-(NSUInteger)cardsCountForMatch
{
    if (self.hardMode) {
        return 3;
    } else {
        return 2;
    }
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(NSArray *)cardCombination:(NSArray *)array
{
    NSMutableArray *ary = [NSMutableArray array];
 
    if (!self.hardMode) {
        for (id obj in array) {
            [ary addObject:@[obj]];
        }
    } else {
        for (id obj in array) {
            for (id other in array) {
                if (obj == other) {
                    continue;
                }
                
                id first = obj;
                id last = other;
                if (obj < other) {
                    first = other;
                    last = obj;
                }
                
                NSArray *comb = @[first, last];
                if (![ary containsObject:comb]) {
                    [ary addObject:comb];
                }
            }
        }
    }
    
    return [ary copy];
}

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    self.started = YES;
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSArray *ar = [self cardCombination:self.cards];
            for (NSArray *a in ar) {
//                NSLog(@"%@ + %@", a[0], a[1]);
                if ([card match:a]) {
                    int matchScore = [card match:a];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        for (Card *otherCard in a) {
                            otherCard.matched = YES;
                        }
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        for (Card *otherCard in a) {
                            otherCard.chosen = NO;
                        }
                    }
                    break;
                }
            }
            
            // match against another card
//            for (Card *otherCard in self.cards) {
//                if (otherCard.isChosen && !otherCard.isMatched) {
//                    int matchScore = [card match:@[otherCard]];
//                    if (matchScore) {
//                        self.score += matchScore * MATCH_BONUS;
//                        card.matched = YES;
//                        otherCard.matched = YES;
//                    } else {
//                        self.score -= MISMATCH_PENALTY;
//                        otherCard.chosen = NO;
//                    }
//                    break;
//                }
//            }
            self.score = COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (self.cards.count > index) ? self.cards[index] : nil;
}

@end
