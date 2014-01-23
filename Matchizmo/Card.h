//
//  Card.h
//  Matchizmo
//
//  Created by Павел Лазурейкис on 22.01.14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

@import Foundation;

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(Card*)card;
//-(int)match:(NSArray*)cards; // of Card
@end
