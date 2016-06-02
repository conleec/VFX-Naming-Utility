//
//  EDLViewController.m
//  VFX_160523
//
//  Created by Christopher Conlee on 5/26/16.
//  Copyright (c) 2016 Christopher Conlee. All rights reserved.
//

#import "EDLViewController.h"
#import "Event.h"

@interface EDLViewController ()

@end

@implementation EDLViewController

- (id) init {
    self = [super init];
    if (self) {
        edl = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)menuOpenEDL:(id)sender {
    
    __block NSString *tempEvent = @"", *tempSrcStart = @"", *tempSrcEnd = @"", *tempRecStart = @"", *tempRecEnd = @"";
    
    
    NSOpenPanel* edlPanel = [NSOpenPanel openPanel];
    
    [edlPanel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            
            NSMutableString *edlAtURL = [[NSMutableString alloc]
                                         initWithContentsOfURL:[edlPanel URL]
                                         encoding:NSUTF8StringEncoding
                                         error:nil];
            
            int tempEDLStringLength = (int)[edlAtURL length];
            
            if (tempEDLStringLength >= 5 && [[edlAtURL substringToIndex:4] caseInsensitiveCompare:@"title"]) {
                
                NSArray *arrayLinesFromEDL = [edlAtURL componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
                
                int eventCount = 0;
                
                for (id currentLine in arrayLinesFromEDL) {
                    
                    //Strips special characters and creates clean array of elements
                    NSString *trimmedLine = [currentLine stringByReplacingOccurrencesOfString:@"[ \\t]+"
                                                                                   withString:@" "
                                                                                      options:NSRegularExpressionSearch
                                                                                        range:NSMakeRange(0, [currentLine length])];
                    
                    NSArray *tempLineElements = [trimmedLine componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    
                    if ([tempLineElements count] == 9) {
                        
                        tempEvent = tempLineElements[0];
                        tempSrcStart = tempLineElements[5];
                        tempSrcEnd = tempLineElements[6];
                        tempRecStart = tempLineElements[7];
                        tempRecEnd = tempLineElements[8];
                        
                    }
                    
                    if ([tempLineElements count] == 8) {
                        
                        tempEvent = tempLineElements[0];
                        tempSrcStart = tempLineElements[4];
                        tempSrcEnd = tempLineElements[5];
                        tempRecStart = tempLineElements[6];
                        tempRecEnd = tempLineElements[7];
                        
                    }
                    
                    if ([tempLineElements count] >= 4 && [tempLineElements[0] isEqualToString:@"*LOC:"]) {
                        
                        unsigned long locatorLineLength = [tempLineElements count];
                        
                        int i = 0;
                        
                        NSMutableString *locatorText = [[NSMutableString alloc] init];
                        
                        for (0; i<= locatorLineLength - 4; i++) {
                            [locatorText appendFormat:@"%@ ", tempLineElements[3+i]];
                        }
                        
                        Event *e = [[Event alloc] init];
                        
                        e.edlEvent = tempEvent;
                        e.srcStart = tempSrcStart;
                        e.srcEnd = tempSrcEnd;
                        e.recStart = tempRecStart;
                        e.recEnd = tempRecEnd;
                        e.markerColor = tempLineElements[2];
                        e.vfxName = locatorText;
                        
                        [edl addObject:e];
                        
                        eventCount++;
                        
                    }
                }
                [tableView reloadData];
            }
        }
    }];
}

- (IBAction)nameVFX:(id)sender {
    
    int count = 0;
    
    for (id currentLine in edl) {
        Event *e = [edl objectAtIndex:count];
        NSLog(@"%@ %@ %@ %@ %@ %@", e.edlEvent, e.srcStart, e.srcEnd, e.recStart, e.recEnd, e.vfxName);
        count++;
    }
    
    
    
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return [edl count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Event *e = [edl objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    return [e valueForKey:identifier];
    
}




@end
