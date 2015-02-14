//
//  LibraryAPI.h
//  CmapusNavigation
//  Library API make sure place infomation initialize only once in APP by using singlton pattern
//  Created by Xitao Lv on 4/11/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Infomation.h"

@interface LibraryAPI : NSObject

+ (LibraryAPI*)sharedInstance;
- (NSArray *) getInfo;
@end
