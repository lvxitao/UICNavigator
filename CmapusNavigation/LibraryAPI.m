//
//  LibraryAPI.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 4/11/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "LibraryAPI.h"
#import "InfoManager.h"

// a class to implment singleton design pattern

@interface LibraryAPI(){
    //class property infomanager
    
    InfoManager *infomanager;
}
@end
@implementation LibraryAPI

// singleton implementation
// a infomanager will be initialized when it is called in application

+ (LibraryAPI*)sharedInstance
{
    // static variable to hold the global instance
    static LibraryAPI *_sharedInstance = nil;
    
    // ensures that the initialization code executes only once
    static dispatch_once_t oncePredicate;
    
    // the initializer is never called again once the class has been instantiated.
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

// LibraryAPI initialize method
- (id)init
{
    self = [super init];
    if (self) {
        infomanager = [[InfoManager alloc] init];
        
    }
    return self;
}
- (NSArray*)getInfo
{
    return [infomanager getInfo];
}

@end
