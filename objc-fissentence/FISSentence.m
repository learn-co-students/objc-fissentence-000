//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Danny Fenjves on 9/9/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property(strong,nonatomic,readwrite)NSString *sentence;

-(void)assembleSentence;

-(BOOL)validWord:(NSString *)word;

-(BOOL)validPunctuation:(NSString *)punctuation;

-(BOOL)validIndex:(NSUInteger)index;


@end

@implementation FISSentence

-(void)assembleSentence{
     NSMutableString *assembledSentence = [[NSMutableString alloc]init];
    [assembledSentence appendString:[self.words componentsJoinedByString:@" "]];
    [assembledSentence appendString:self.punctuation];
    self.sentence = assembledSentence;
}

-(BOOL)validWord:(NSString *)word{
    if (word && !([word isEqualToString: @""] || [word isEqualToString: @" "])) {
        return YES;
    }
    return NO;
}

-(BOOL)validPunctuation:(NSString *)punctuation{
    //must not accept an empty array or nil
    if ([@[@".",@",",@"!",@"?",@":",@";",@"-"] containsObject:punctuation]) {
        return YES;
    }
    return NO;
}

-(BOOL)validIndex:(NSUInteger)index{
    if (index < [self.words count]) {
        return YES;
    }
    return NO;
}

-(void)addWord:(NSString *)word{
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    if (([words count] > 0) && [self validPunctuation:punctuation]) {
        for (NSString *word in words) {
            [self addWord:word];
        }
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}

-(void)removeWordAtIndex:(NSUInteger) index{
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger) index{
    if ([self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

-(void)replacePunctuationWithPunctuation:(NSString *) punctuation{
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}

-(void)replaceWordAtIndex:(NSUInteger) index withWord:(NSString *)word{
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}

@end
