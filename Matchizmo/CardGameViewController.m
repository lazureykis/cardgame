//
//  CardGameViewController.m
//  Matchizmo
//
//  Created by Павел Лазурейкис on 22.01.14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) unsigned flipsCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

@synthesize deck = _deck;

- (Deck*)deck
{
    if (!_deck)
    {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)setFlipsCount:(unsigned)flipsCount
{
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %u", self.flipsCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        if (card) {
            [sender setTitle:card.contents forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            self.flipsCount++;
        } else {
            [sender removeFromSuperview];
        }
    }
}

@end
