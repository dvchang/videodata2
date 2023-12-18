//
//  DataFetcher.m
//  VideoData2
//
//  Created by David Chang on 12/17/23.
//

#import "VDTDataFetcher.h"

#import "AFNetworking.h"

@implementation VDTData

- (instancetype)initWith:(NSString *)imageURL videoURL:(NSString *)videoURL {
    self = [super init];
    if (self) {
        _imageURL = imageURL;
        _videoURL = videoURL;
    }
    return self;
}

@end

@interface VDTDataFetcher()
@property(nonatomic, nonnull, strong) AFURLSessionManager *manager;
@end

@implementation VDTDataFetcher

- (void)fetchData:(DataFetchCompletionBlock)completion {
    
    if (!self.manager) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    
    NSString *URLString = @"https://jsonplaceholder.typicode.com/photos";
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:nil error:nil];
    [[self.manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
        } else if (![responseObject isKindOfClass:[NSArray class]]) {
            completion(nil, [NSError errorWithDomain:@"VDTDataFetcher fetching" code:1 userInfo:nil]);
        } else {
            NSMutableArray<VDTData *> *dataArray = [NSMutableArray array];
            [dataArray addObject:[[VDTData alloc] initWith:@"goodone" videoURL:@"badone"]];
            completion(dataArray, nil);
        }
    }] resume];
}

@end
