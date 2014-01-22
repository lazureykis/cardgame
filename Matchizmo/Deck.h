//
//  Deck.h
//  Matchizmo
//
//  Created by Павел Лазурейкис on 23.01.14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card*)card atTop:(BOOL)atTop;
- (void)addCard:(Card*)card;

- (Card*)drawRandomCard;

@end
