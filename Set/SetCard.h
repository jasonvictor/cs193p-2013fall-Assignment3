//
//  SetCard.h
//  Set
//
//  Created by Victor, Jason M on 5/5/14.
//  Copyright (c) 2014 Victor, Jason M. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong, nonatomic) NSNumber *number; // 1, 2 or 3
@property (strong, nonatomic) NSString *symbol; // diamond, squiggle, oval
@property (strong, nonatomic) NSString *shading; // solid, striped, open
@property (strong, nonatomic) NSString *color; // red, green, purple


+ (NSUInteger) maxNumber;
+ (NSArray *)validSymbols;
+ (NSArray *)validShading;
+ (NSArray *)validColors;

@end
