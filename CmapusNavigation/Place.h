//
//  Place.h
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/31/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Place : NSObject {
    NSString *category;
    NSString *name;
}

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *name;

+ (id)placeOfCategory:(NSString*)category name:(NSString*)name;

@end
