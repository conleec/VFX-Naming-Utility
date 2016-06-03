//
//  EDLViewController.h
//  VFX_160523
//
//  Created by Christopher Conlee on 5/26/16.
//  Copyright (c) 2016 Christopher Conlee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MarkerColorSearchController;

@interface EDLViewController : NSViewController <NSTableViewDataSource> {
    @private
    
    MarkerColorSearchController *markerColorSearchController;
    IBOutlet NSTableView *tableView;
    NSMutableArray *edl;
}

- (IBAction)showMarkerColorSearchWindow:(id)sender;


@end
