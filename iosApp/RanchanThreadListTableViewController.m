//
//  RanchanThreadListTableViewController.m
//  ThreadList
//
//  Created by John Arley Burns on 10/07/14.
//  Copyright (c) 2014 John Arley Burns. All rights reserved.
//

#import "RanchanThreadListTableViewController.h"
#import "RanchanThreadItem.h"
#import "RanchanAddThreadItemViewController.h"

@interface RanchanThreadListTableViewController ()

@property NSMutableArray *threadItems;

@end

@implementation RanchanThreadListTableViewController

- (void)loadInitialData {
    RanchanThreadItem *item1 = [[RanchanThreadItem alloc] init];
    item1.itemName = @"what anime should i watch?"; // \ndont say boku no pico lol\ni like naruto and one piece so something\ngood like that pls"; // 14p 4i
    [self.threadItems addObject:item1];
    
    RanchanThreadItem *item2 = [[RanchanThreadItem alloc] init];
    item2.itemName = @"How can you tell if someone is unemployed? List all the telltale signs.";
    [self.threadItems addObject:item2]; // 128p 12r
    
    
    RanchanThreadItem *item3 = [[RanchanThreadItem alloc] init];
    item3.itemName = @"23 decides what I say to these tumblr fags sitting next to me.";
    [self.threadItems addObject:item3]; //23p 2r
}

- (IBAction)unwindToList:(UIStoryboardSegue*) segue
{
    RanchanAddThreadItemViewController *source = [segue sourceViewController];
    RanchanThreadItem *item = source.threadItem;
    if (item != nil) {
        [self.threadItems addObject:item];
        [self.tableView reloadData];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.threadItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.threadItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    RanchanThreadItem *threadItem = [self.threadItems objectAtIndex:indexPath.row];
    cell.textLabel.text = threadItem.itemName;
    
    if (threadItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    RanchanThreadItem *tappedItem = [self.threadItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
