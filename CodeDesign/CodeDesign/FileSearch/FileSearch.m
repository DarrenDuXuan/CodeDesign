//
//  FileSearch.m
//  CodeDesign
//
//  Created by darren on 2020/8/22.
//  Copyright © 2020 杜璇. All rights reserved.
//

#import "FileSearch.h"
#import "FileSearchProtocol.h"


@interface FileSearch ()

@property (strong, nonatomic) NSDictionary *searchVersion1MethodStrDict;

@property (strong, nonatomic) NSDictionary *searchVersion2ModelName;

@end

@implementation FileSearch

- (instancetype)init {
    self = [super init];
    if (self) {
        self.searchVersion1MethodStrDict = @{
            [@(FileSearchRulesFileNameBegin) stringValue]:NSStringFromSelector(@selector(searchRulesFileNameBegin:)),
            [@(FileSearchRulesFileNameEnd) stringValue]:NSStringFromSelector(@selector(searchRulesFileNameEnd:)),
            [@(FileSearchRulesExtension) stringValue]:NSStringFromSelector(@selector(searchRulesExtension:))
        };
        
        self.searchVersion2ModelName = @{
            [@(FileSearchRulesFileNameBegin) stringValue]:@"SearchFileNameBeginModel",
            [@(FileSearchRulesFileNameEnd) stringValue]:@"SearchFileNameEndModel",
            [@(FileSearchRulesExtension) stringValue]:@"SearchFileExtensionModel"
        };
    }
    return self;
}


#pragma mark - Version 1 & Version 2
- (NSArray <NSString *> *)searchFileListV1:(FileSearchRules)rules key:(NSString *)key {

    // 1. 直接 if else 判断，根据对应的 rules 调用对应的方法。
    if (rules == FileSearchRulesFileNameBegin) {
        return [self searchRulesFileNameBegin:key];
    } else if (rules == FileSearchRulesFileNameEnd) {
        return [self searchRulesFileNameEnd:key];
    } else {
        return [self searchRulesExtension:key];
    }
    
    // 2. 通过预置的 searchVersion1MethodStrDict Key=rules value=methodStr，调用对应的方法，扩展性以及可读性不是太好。
    NSString *methodName = self.searchVersion1MethodStrDict[[@(rules) stringValue]];
    if (methodName) {
        [self performSelector:NSSelectorFromString(methodName) withObject:key afterDelay:0];
    }
    
    // 3. 通过 rules 获取对应的实现的对象，再通过调用 FileSearchProtocol 的 search 方法。
    return [[self getFileSearchMode:rules] searchFileList:key];
}

- (id <FileSearchProtocol>)getFileSearchMode:(FileSearchRules)rules {
    NSString *className = self.searchVersion2ModelName[[@(rules) stringValue]];
    if (className) {
        return [[NSClassFromString(className) alloc] init];
    }
    return nil;
}

- (NSArray <NSString *> *)searchRulesFileNameBegin:(NSString *)key {
    return nil;
}

- (NSArray <NSString *> *)searchRulesFileNameEnd:(NSString *)key {
    return nil;
}

- (NSArray <NSString *> *)searchRulesExtension:(NSString *)key {
    return nil;
}

#pragma mark - Version 3
- (NSArray <NSString *> *)searchFileListV3:(FileSearchRulesOptions)rules key:(NSString *)key {
    /*
     这边要考虑的 case 就比较多了
     1. 不同的规则组合
     2. 性能，因为要通过很多规则去查询，所以性能也要考虑。
     3. 扩展性
     4. 可读性
     */
    return nil;
}

@end
