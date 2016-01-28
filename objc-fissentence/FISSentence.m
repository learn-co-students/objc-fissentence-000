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
    
    NSString *validPunctuation = @".?!,;:—";
    for (NSUInteger i = 0; i < punctuation.length; i++) {
        if (![validPunctuation containsString:[NSString stringWithFormat:@"%c", [punctuation characterAtIndex:i]]]) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)validIndex:(NSUInteger)index {
    
    return (index < self.words.count);
}

- (void)addWord:(NSString *)word {
    
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    
    if (words && words.count && [self validPunctuation:punctuation]) {
        NSString *word;
        for (NSUInteger i = 0; i < words.count; i++) {
            word = [words objectAtIndex:i];
            if ([self validWord:word]) {
                [self.words addObject:word];
            }
        }
        [self setPunctuation:punctuation];
    }
    [self assembleSentence];
}

- (void)removeWordAtIndex:(NSUInteger)index {
    
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    
    if ([self validPunctuation:punctuation]) {
        [self setPunctuation:punctuation];
    }
    [self assembleSentence];
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    
    //
}

@end
