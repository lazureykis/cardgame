//
//  CardGameViewController.m
//  Matchizmo
//
//  Created by Павел Лазурейкис on 22.01.14.
//  Copyright (c) 2014 Павел Лазурейкис. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UIButton *startNewGameButton;
@property (strong, nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

@synthesize deck = _deck;
@synthesize game = _game;

-(void)resetGame
{
    _game = nil;
}

- (IBAction)startNewGameTouched:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New game"
                                                    message:@"Are you sure?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        [self resetGame];
        [self updateUI];
    }
}

- (CardMatchingGame*)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (Deck*)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (Deck*)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        unsigned long cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.startNewGameButton.enabled = self.game.isStarted;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSString *)titleForCard:(Card*)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage*)backgroundImageForCard:(Card*)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
