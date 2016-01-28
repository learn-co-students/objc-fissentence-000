//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Ken M. Haggerty on 1/28/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()
@property (nonatomic, strong, readwrite) NSString *sentence;
- (void)assembleSentence;
- (BOOL)validWord:(NSString *)word;
- (BOOL)validPunctuation:(NSString *)punctuation;
- (BOOL)validIndex:(NSUInteger)index;
@end

@implementation FISSentence

- (void)assembleSentence {
    
    [self setSentence:[NSString stringWithFormat:@"%@%@", [self.words componentsJoinedByString:@" "], self.punctuation]];
}

- (BOOL)validWord:(NSString *)word {
    
    return (word && ![word isEqualToString:@""] && ![word isEqualToString:@" "]);
}

- (BOOL)validPunctuation:(NSString *)punctuation {
    
    return NO;
}

- (BOOL)validIndex:(NSUInteger)index {
    
    return NO;
}

- (void)addWord:(NSString *)word {
    
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    
    //
}

- (void)removeWordAtIndex:(NSUInteger)index {
    
    //
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
    //
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    
    //
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    
    //
}

@end
