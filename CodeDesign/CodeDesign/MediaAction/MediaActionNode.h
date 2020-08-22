//
//  MediaActionNode.h
//  CodeDesign
//
//  Created by darren on 2020/8/22.
//  Copyright © 2020 杜璇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MediaActionType) {
    MediaActionTypeDownload,
    MediaActionTypeUnZip,
    MediaActionTypeDecoding,
    MediaActionTypeCache,
};

@interface MediaActionNode : NSObject

@property (assign, nonatomic) MediaActionType mediaActionType;

// 看具体情况具体分析
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSData *data;

// 对应操作实现的文件
@property (strong, nonatomic) id mediaData;

@property (strong, nonatomic) MediaActionNode *nextResponseNode;

@end

NS_ASSUME_NONNULL_END
