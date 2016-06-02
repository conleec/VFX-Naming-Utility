//
//  Event.h
//  VFX_160523
//
//  Created by Christopher Conlee on 5/26/16.
//  Copyright (c) 2016 Christopher Conlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject {
@private
    NSString *edlEvent;
    NSString *srcStart;
    NSString *srcEnd;
    NSString *recStart;
    NSString *recEnd;
    NSString *markerColor;
    NSString *vfxName;
}

@property (copy) NSString *edlEvent;
@property (copy) NSString *srcStart;
@property (copy) NSString *srcEnd;
@property (copy) NSString *recStart;
@property (copy) NSString *recEnd;
@property (copy) NSString *markerColor;
@property (copy) NSString *vfxName;


@end
