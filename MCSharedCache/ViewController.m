//
//  ViewController.m
//  MCSharedCache
//
//  Created by Baglan on 5/9/14.
//  Copyright (c) 2014 MobileCreators. All rights reserved.
//

#import "ViewController.h"
#import "MCSharedCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[MCSharedCache sharedInstance] setObject:@"content" forKey:@"key"];
    NSLog(@"--- %@", [[MCSharedCache sharedInstance] objectForKey:@"key"]);
}

@end
