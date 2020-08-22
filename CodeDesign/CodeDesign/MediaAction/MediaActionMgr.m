//
//  MediaActionMgr.m
//  CodeDesign
//
//  Created by darren on 2020/8/22.
//  Copyright © 2020 杜璇. All rights reserved.
//

#import "MediaActionMgr.h"
#import "MediaActionNode.h"

@implementation MediaActionMgr



#pragma mark - Version 1 Normal
- (void)mediaAction1:(NSURL *)url {
    
}

// 看具体情况，block 返回什么值
// 1. download
- (void)downloadMedia:(NSURL *)url complete:(void (^)(NSString *filePath))complete {
    
}

// 2. unzip
- (void)unZipFile:(NSURL *)url complete:(void (^)(id))complete {
    
}

/*
 ...
 思路就是根据文件类型具体调用具体方法。
 具体操作的东西要放在不同的类中去处理，比如下载放在下载类、解压放在解压类，这里懒得写了。
 */

#pragma mark - Version 2 尝试用数据结构解决
- (void)mediaAction2:(NSURL *)url {
    
}

/*
 根据文件类型，使用链表结构初始化 Node ，初始化阶段对不同类型的文件，初始化不同的链表流程。
 生成 Node 阶段就可以定死对应文件类型，扩展的话相对简单。
 思路大概这样子。
 */
- (MediaActionNode *)getMediaActionNode:(NSURL *)url {
    NSString *urlStr = url.absoluteString;
    if ([urlStr hasPrefix:@"zip"]) {
        
    }
    return nil;
}

@end
