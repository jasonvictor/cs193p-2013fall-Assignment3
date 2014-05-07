//
//  SetCard.m
//  Set
//
//  Created by Victor, Jason M on 5/5/14.
//  Copyright (c) 2014 Victor, Jason M. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize number = _number;
@synthesize symbol = _symbol;
@synthesize shading = _shading;
@synthesize color = _color;
@synthesize attributedContents = _attributedContents;

- (NSString *) contents {
    //Hint states I can return nil
    //return [NSString stringWithFormat:@"%@ %@ %@ %@", self.number, self.symbol, self.shading, self.color];
    return nil;
}

- (NSAttributedString *) attributedContents {
    NSString *returnValue = @"";
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < [self.number intValue]; i++) {
        returnValue = [NSString stringWithFormat:@"%@%@", returnValue, self.symbol];
    }

    //Set color
    UIColor *myColor = [UIColor redColor]; //default to red
    if ([self.color isEqualToString:@"red"]) {
        myColor = [UIColor redColor];
    }
    else if ([self.color isEqualToString:@"green"]) {
        myColor = [UIColor greenColor];
    }
    else if ([self.color isEqualToString:@"purple"]) {
        myColor = [UIColor purpleColor];
    }
    [attributes addEntriesFromDictionary: @{
                                            NSForegroundColorAttributeName : myColor,
                                            NSStrokeColorAttributeName: myColor}];

    
    //Set shading
    if ([self.shading isEqualToString:@"solid"]) {
        [attributes addEntriesFromDictionary:@{NSStrokeWidthAttributeName: @0}];
    }
    else if ([self.shading isEqualToString:@"striped"]) {  //make alpha for now
        [attributes addEntriesFromDictionary:@{NSStrokeWidthAttributeName : @0,
                                                     NSForegroundColorAttributeName:
                                                        [myColor colorWithAlphaComponent:0.1]}];
    }
    else if ([self.shading isEqualToString:@"open"]) {
        [attributes addEntriesFromDictionary:@{NSStrokeWidthAttributeName: @5}];
    }
    
    return [[NSMutableAttributedString alloc] initWithString:returnValue attributes:attributes];
}

#pragma mark Valid Values Of Properties
+ (NSUInteger) maxNumber {
    return 3;
}

+ (NSArray *)validSymbols {
    return @[@"▲", @"◼︎", @"●"];
}

+ (NSArray *)validShading {
    return @[@"solid",@"stripped",@"open"];
}

+ (NSArray *)validColors {
    return @[@"red",@"green",@"purple"];
}

#pragma mark setters
- (void) setNumber:(NSNumber *)number {
    if ([number intValue] <= [SetCard maxNumber]) {
        _number = number;
    }
}

- (void) setSymbol:(NSString *)symbol {
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (void) setShading:(NSString *)shading {
    if ([[SetCard validShading] containsObject:shading]) {
        _shading = shading;
    }
}

- (void) setColor:(NSString *)color {
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}


//Overridden to deal with set card match detection
// Assuming score is just the number of matches
-(int) match:(NSArray *) otherCards
{
    int score = 0;

    //Assumes 3 cards are selected (meaning this card plus 2 others)
    if ([otherCards count] == 2) {
        
        NSCountedSet *numberSet =  [[NSCountedSet alloc] init];
        NSCountedSet *symbolSet =  [[NSCountedSet alloc] init];
        NSCountedSet *colorSet =   [[NSCountedSet alloc] init];
        NSCountedSet *shadingSet = [[NSCountedSet alloc] init];
        
        [numberSet addObject:self.number];
        [symbolSet addObject:self.symbol];
        [colorSet addObject:self.color];
        [shadingSet addObject:self.shading];
        
        // Separate out the properties into separate "bags"
        for (SetCard * otherCard in otherCards) {
            
            [numberSet addObject:otherCard.number];
            [symbolSet addObject:otherCard.symbol];
            [colorSet addObject:otherCard.color];
            [shadingSet addObject:otherCard.shading];
        }
        
        //How many set cards match?
        // NOTE - they only match if ALL properties have exactly 1 or 3 unique values.  (or if they all DON'T have 2)
        
        if (numberSet.count     != 2
            && symbolSet.count  != 2
            && colorSet.count   != 2
            && shadingSet.count !=2) {
            
            score = 1;
        }
        else { score = 0; }
        
    }
    
    return score;
}

- (NSString *) description {
    return self.contents;
}



@end
