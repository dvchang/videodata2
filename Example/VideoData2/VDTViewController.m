//
//  VDTViewController.m
//  VideoData2
//
//  Created by 1630880 on 12/17/2023.
//  Copyright (c) 2023 1630880. All rights reserved.
//

#import "VDTViewController.h"
#import "VDTDataFetcher.h"

@interface VDTViewController ()
@property(nonatomic, strong) VDTDataFetcher *fetcher;
@end

@implementation VDTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fetcher = [[VDTDataFetcher alloc] init];
    [self.fetcher fetchData:^(NSArray<VDTData *> * _Nullable data, NSError * _Nullable error) {
        NSLog(@"good ! %@", data);
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
