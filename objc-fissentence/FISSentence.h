//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Danny Fenjves on 9/9/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property(strong, nonatomic, readonly)NSString *sentence;

@property(strong, nonatomic)NSMutableArray *words;

@property(strong, nonatomic)NSString *punctuation;


-(void)addWord:(NSString *)word;

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation;

-(void)removeWordAtIndex:(NSUInteger) index;

-(void)insertWord:(NSString *)word atIndex:(NSUInteger) index;

-(void)replacePunctuationWithPunctuation:(NSString *) punctuation;

-(void)replaceWordAtIndex:(NSUInteger) index withWord:(NSString *)word;


@end
