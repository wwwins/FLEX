//
//  AAPLCatalogTableTableViewController.m
//  UICatalog
//
//  Created by Ryan Olson on 7/17/14.

#import "AAPLCatalogTableTableViewController.h"

#if DEBUG
// FLEX should only be compiled and used in debug builds.
#import "FLEXManager.h"
#import "LogManager.h"
#endif

@interface AAPLCatalogTableTableViewController ()

@property LogManager *logManager;

@end

@implementation AAPLCatalogTableTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#if DEBUG
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"FLEX" style:UIBarButtonItemStylePlain target:self action:@selector(flexButtonTapped:)];
    _logManager = [LogManager sharedManager];
#endif
}

- (void)flexButtonTapped:(id)sender
{
#if DEBUG
    // This call shows the FLEX toolbar if it's not already shown.
    [[FLEXManager sharedManager] showExplorer];
  
    [_logManager log:@"Start LogManager..."];

#endif
}

@end
