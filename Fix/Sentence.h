//
//  Sentence.h
//  Fix
//
//  Created by Nicholas Barr on 10/23/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sentence : NSObject {
    NSString *fullText;
    
}

@property (nonatomic, retain) NSString *fullText;

+ (Sentence *)sharedSentence;

@end
