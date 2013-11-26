//
//  Sentence.m
//  Fix
//
//  Created by Nicholas Barr on 10/23/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "Sentence.h"

static Sentence *sharedSentence = nil;

@implementation Sentence

@synthesize fullText;
@synthesize gameLevel;

#pragma mark -
#pragma mark Singleton Methods

+ (Sentence *)sharedSentence {
    if(sharedSentence == nil){
        sharedSentence = [[super allocWithZone:NULL] init];
    }
    return sharedSentence;
}


@end

