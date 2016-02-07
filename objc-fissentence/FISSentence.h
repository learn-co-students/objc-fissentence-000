//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Molly Gingras on 2/7/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (strong, nonatomic, readonly) NSString *sentence;
@property (strong, nonatomic) NSString *punctuation;
@property (strong, nonatomic) NSMutableArray *words;

- (void)addWord:(NSString *)word;
- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation;
- (void)removeWordAtIndex:(NSUInteger)index;
- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index;
- (void)replacePunctuationWithPunctuation:(NSString *)punctuation;
- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word;

@end
