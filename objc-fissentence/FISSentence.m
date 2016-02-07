//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Molly Gingras on 2/7/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

- (void)assembleSentence;
- (BOOL)validWord:(NSString *)word;
- (BOOL)validPunctuation:(NSString *)punctuation;
- (BOOL)validIndex:(NSUInteger)index;

@end

@implementation FISSentence

- (void)addWord:(NSString *)word{
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    if (!words || !words.count || ![self validPunctuation:punctuation]) {
        return;
    }
    self.punctuation = punctuation;
    for (NSString *word in words) {
        [self addWord:word];
    }
}

- (void)removeWordAtIndex:(NSUInteger)index{
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    if ([self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}



- (void)assembleSentence{
    self.sentence = [[self.words componentsJoinedByString:@" "] stringByAppendingString:self.punctuation];
}

- (BOOL)validWord:(NSString *)word{
    return word.length && ![word isEqualToString:@" "];
}

- (BOOL)validPunctuation:(NSString *)punctuation{
    return punctuation && [@".?!,;:—" containsString:punctuation];
}

- (BOOL)validIndex:(NSUInteger)index{
    return index < self.words.count;
}


@end
