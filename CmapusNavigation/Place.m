//
//  Place.m
//  CmapusNavigation
//
//  Created by Xitao Lv on 1/31/14.
//  Copyright (c) 2014 Xitao Lv. All rights reserved.
//

#import "Place.h"

@implementation Place;
@synthesize category;
@synthesize name;

+ (id)placeOfCategory:(NSString *)category name:(NSString *)name
{
    Place *newPlace = [[self alloc] init];
    newPlace.category = category;
    newPlace.name = name;
    return newPlace;
}

@end
