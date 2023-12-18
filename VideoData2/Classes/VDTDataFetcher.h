//
//  DataFetcher.h
//  VideoData2
//
//  Created by David Chang on 12/17/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VDTData : NSObject
@property(nonatomic, readonly) NSString *imageURL;
@property(nonatomic, readonly) NSString *videoURL;
- (instancetype)initWith:(NSString *)imageURL videoURL:(NSString *)videoURL;
@end


typedef void (^DataFetchCompletionBlock)(NSArray<VDTData *>  * _Nullable data, NSError  * _Nullable error);

@interface VDTDataFetcher : NSObject

- (void)fetchData:(DataFetchCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
