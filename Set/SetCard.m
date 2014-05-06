//
//  SetCard.m
//  Set
//
//  Created by Victor, Jason M on 5/5/14.
//  Copyright (c) 2014 Victor, Jason M. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSUInteger) maxNumber {
    return 3;
}

+ (NSArray *)validSymbols {
    return @[@"diamond", @"squiggle", @"oval"];
}

+ (NSArray *)validShading {
    return @[@"solid",@"stripped",@"open"];
}

+ (NSArray *)validColors {
    return @[@"red",@"green",@"purple"];
}

@end
