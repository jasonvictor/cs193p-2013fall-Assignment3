//
//  SetCardDeck.m
//  Set
//
//  Created by Victor, Jason M on 5/5/14.
//  Copyright (c) 2014 Victor, Jason M. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init {
    self = [super init];
    if (self) {
        
        for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
            for (NSString *symbol in [SetCard validSymbols]) {
                for (NSString *shade in [SetCard validShading]) {
                    for (NSString *color in [SetCard validColors]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.number = [NSNumber numberWithInt:number];
                        card.symbol = symbol;
                        card.shading = shade;
                        card.color = color;
                        [self addCard:card];
                    }
                }
            }
        }
        
        
    }

    return self;
}


@end
