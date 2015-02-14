//
//  InfoManager.h
//  CmapusNavigation
//  infoManager initialize place infomation
//  Created by Xitao Lv on 4/11/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Infomation.h"

@interface InfoManager : NSObject{
    // array for all map points
    NSMutableArray *info;
}
- (NSArray*)getInfo;


@end
