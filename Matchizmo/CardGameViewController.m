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
@end

@implementation CardGameViewController

- (void)setFlipsCount:(unsigned)flipsCount
{
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %u", self.flipsCount];
}

- (IBAction)cardTapped:(UIButton *)sender {
    if ([sender.currentTitle length] > 0) {
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"A♠️" forState:UIControlStateNormal];
    }
    
    self.flipsCount++;
}

@end
