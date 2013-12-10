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
@synthesize level;

#pragma mark -
#pragma mark Singleton Methods


- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
   // self.level = [decoder decodeObjectForKey:@"level"];
    self.level = [[decoder decodeObjectForKey:@"count"] unsignedIntegerValue];
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithUnsignedInteger:self.level] forKey:@"level"];
}


+ (Sentence *)sharedSentence {
    if(sharedSentence == nil){
        sharedSentence = [[super allocWithZone:NULL] init];
        sharedSentence.level = 0;
    }
    return sharedSentence;
}


@end

