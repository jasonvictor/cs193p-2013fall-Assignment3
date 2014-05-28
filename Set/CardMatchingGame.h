//
//  CardMatchingGame.h
//  Assignment1
//
//  Created by Victor, Jason M on 2/21/14.
//  Copyright (c) 2014 Victor, Jason M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject


-(instancetype) initWithCardCount:(NSUInteger) count
                        usingDeck:(Deck *) deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
-(void)resetGame;
-(void)setGameMode:(int) matchCount; //2 or 3 only - number of cards to match
-(int)gameMode;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSMutableAttributedString *gameLog;

@end
