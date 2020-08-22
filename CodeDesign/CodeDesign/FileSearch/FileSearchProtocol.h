//
//  FileSearchProtocol.h
//  CodeDesign
//
//  Created by darren on 2020/8/22.
//  Copyright © 2020 杜璇. All rights reserved.
//

#ifndef FileSearchProtocol_h
#define FileSearchProtocol_h

@protocol FileSearchProtocol <NSObject>
- (NSArray <NSString *> *)searchFileList:(NSString *)key;
@end

#endif /* FileSearchProtocol_h */
