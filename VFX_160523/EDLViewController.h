//
//  EDLViewController.h
//  VFX_160523
//
//  Created by Christopher Conlee on 5/26/16.
//  Copyright (c) 2016 Christopher Conlee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface EDLViewController : NSViewController <NSTableViewDataSource> {
    @private
    IBOutlet NSTableView *tableView;
    NSMutableArray *edl;
}




@end
