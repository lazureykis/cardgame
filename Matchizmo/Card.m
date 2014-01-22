//
//  Card.m
//  Matchizmo
//
//  Created by Павел Лазурейкис on 22.01.14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize contents = _contents;
@synthesize chosen = _chosen;
@synthesize matched = _matched;

-(int)match:(Card *)card
{
    int score = 0;
    
    if ([self.contents isEqualToString:card.contents]) {
        score = 1;
    }
         
    return score;
}

//-(int)match:(NSArray *)cards
//{
//    int score = 0;
//    
//    for (Card *card in cards) {
//        score++;
//    }
//    
//    return score;
//}

@end
