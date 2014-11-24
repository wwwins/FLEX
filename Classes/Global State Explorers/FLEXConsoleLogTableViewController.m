//
//  FLEXConsoleLogTableViewController.m
//  UICatalog
//
//  Created by wwwins on 2014/11/21.
//  Copyright (c) 2014年 f. All rights reserved.
//

#import "FLEXConsoleLogTableViewController.h"
#import "FLEXUtility.h"
#import "LogManager.h"

@interface FLEXConsoleLogTableViewController () <UISearchBarDelegate>

@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) RLMResults *messages;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation FLEXConsoleLogTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _formatter = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = @"yyyy-MM-dd HH:mm";
        _messages = [[LogMessage allObjects] sortedResultsUsingProperty:@"date" ascending:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = [FLEXUtility searchBarPlaceholderText];
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchBar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Filtering

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
  [searchBar resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_messages count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [FLEXUtility defaultTableViewCellLabelFont];
  }
  
  LogMessage *msg = _messages[indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"[%@]:%@",[_formatter stringFromDate:msg.date], [msg message]];
  
  return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//  FLEXClassesTableViewController *classesViewController = [[FLEXClassesTableViewController alloc] init];
//  classesViewController.binaryImageName = self.filteredImageNames[indexPath.row];
//  [self.navigationController pushViewController:classesViewController animated:YES];
}

@end
