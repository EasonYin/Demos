//
//  EYWindowController.m
//  MacSimulationAddress
//
//  Created by 尹华东 on 2019/5/5.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

#import "EYWindowController.h"

@interface EYWindowController ()
@property (weak) IBOutlet NSTextField *searchText;

@end

@implementation EYWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.


}

void runSystemCommand(NSString *cmd)
{
    [[NSTask launchedTaskWithLaunchPath:@"/bin/sh"
                              arguments:[NSArray arrayWithObjects:@"-c", cmd, nil]]
     waitUntilExit];
}

- (IBAction)findMe:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"findMe" object:nil];
}

- (IBAction)search:(id)sender {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"searchText" object:self.searchText.stringValue];
    
}

- (IBAction)searchText:(NSTextField *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"searchText" object:sender.stringValue];

}

- (IBAction)clearSearchText:(NSTextField *)sender {
    self.searchText.stringValue = @"";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clearSearchText" object:sender.stringValue];
}

- (IBAction)segmentControl:(NSSegmentedControl *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"segmentControl" object:@(sender.selectedSegment)];
    
}


@end
