//
//  FileSearch.h
//  CodeDesign
//
//  Created by darren on 2020/8/22.
//  Copyright © 2020 杜璇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FileSearchRules) {
   FileSearchRulesFileNameBegin,
   FileSearchRulesFileNameEnd,
   FileSearchRulesExtension,
};

typedef NS_OPTIONS(NSUInteger, FileSearchRulesOptions) {
  FileSearchRulesOptionsFileNameBegin = 1 << 0,
  FileSearchRulesOptionsFileNameEnd   = 1 << 1,
  FileSearchRulesOptionsExtension     = 1 << 2,
};

@interface FileSearch : NSObject

- (NSArray <NSString *> *)searchFileListV1:(FileSearchRules)rules key:(NSString *)key;

- (NSArray <NSString *> *)searchFileListV3:(FileSearchRulesOptions)rules key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
