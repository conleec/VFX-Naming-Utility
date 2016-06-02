//
//  Event.m
//  VFX_160523
//
//  Created by Christopher Conlee on 5/26/16.
//  Copyright (c) 2016 Christopher Conlee. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize edlEvent;
@synthesize srcStart;
@synthesize srcEnd;
@synthesize recStart;
@synthesize recEnd;
@synthesize markerColor;
@synthesize vfxName;

- (id) init {
    self = [super init];
    if (self) {
        edlEvent = [[NSString alloc] init];
        srcStart = [[NSString alloc] init];
        srcEnd = [[NSString alloc] init];
        recStart = [[NSString alloc] init];
        recEnd = [[NSString alloc] init];
        markerColor = [[NSString alloc] init];
        vfxName = [[NSString alloc] init];
    }
    
    return self;
}

@end
