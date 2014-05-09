//
//  MCSharedCache.m
//  MCSharedCache
//
//  Created by Baglan on 5/9/14.
//  Copyright (c) 2014 MobileCreators. All rights reserved.
//

#import "MCSharedCache.h"

@implementation MCSharedCache

// Singleton
// Taken from http://lukeredpath.co.uk/blog/a-note-on-objective-c-singletons.html
+ (instancetype)sharedInstance
{
    __strong static id _sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLowMemory) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)onLowMemory
{
#if DEBUG
    NSLog(@"[MCSharedCache onLowMemory]: Cache purged after receiving the UIApplicationDidReceiveMemoryWarningNotification");
#endif
    [self removeAllObjects];
}

@end
