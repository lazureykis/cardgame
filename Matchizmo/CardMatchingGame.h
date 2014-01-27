//
//  CardMatchingGame.h
//  Matchizmo
//
//  Created by Павел Лазурейкис on 23/01/14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

@import Foundation;
#import "Deck.h"

@interface CardMatchingGame : NSObject
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly, getter = isStarted) BOOL started;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;

@end
