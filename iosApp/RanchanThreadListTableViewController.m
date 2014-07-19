//
//  RanchanThreadListTableViewController.m
//  ThreadList
//
//  Created by John Arley Burns on 10/07/14.
//  Copyright (c) 2014 John Arley Burns. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "RanchanThreadListTableViewController.h"
#import "RanchanThreadItem.h"
#import "RanchanAddThreadItemViewController.h"
#import "RanchanTestHarness.h"
//#import "RanchanThreadListTableViewCell.h"

@interface RanchanThreadListTableViewController ()

@property NSMutableArray *threadItems;

@end

@implementation RanchanThreadListTableViewController

//static NSString *CellIdentifier = @"ListPrototypeCell";
//static NSString *CellIdentifier = @"RanchanThreadListTableViewPrototypeCell";
static NSString *CellIdentifier = @"ThreadListPrototypeCell";

- (void)loadInitialData {
    [[RanchanTestHarness sharedManager] addListItems:self.threadItems];
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
    
    //[self.tableView registerClass:[RanchanThreadListTableViewCell class] forCellReuseIdentifier:CellIdentifier];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.threadItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    RanchanThreadListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[RanchanThreadListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //if (cell == nil) {
    //    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    //}// Configure the cell...
    
    RanchanThreadItem *threadItem = [self.threadItems objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = threadItem.content;
    UILabel *contentLabel = (UILabel *)[cell viewWithTag:101];
    contentLabel.text = threadItem.content;
    [contentLabel sizeToFit];
    
    NSInteger dayDiff = (int)[threadItem.date timeIntervalSinceNow] / (60*60*24);
    NSString *dateText;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    if (dayDiff == 0) {
        df.timeStyle = NSDateFormatterShortStyle;
        df.dateStyle = NSDateFormatterNoStyle;
        dateText = [df stringFromDate:threadItem.date];
    }
    else {
        df.timeStyle = NSDateFormatterNoStyle;
        df.dateStyle = NSDateFormatterShortStyle;
        dateText = [df stringFromDate:threadItem.date];
    }
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%d chats ~ %@", threadItem.chats, dateText];
    //cell.detailTextLabel.text = [threadItem thumbUrl];
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:102];
    detailLabel.text = [NSString stringWithFormat:@"%d chats ~ %@", threadItem.chats, dateText];
    [detailLabel sizeToFit];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.layer.cornerRadius = 5;
    imageView.layer.masksToBounds = YES;
    [imageView setImageWithURL:[NSURL URLWithString:[threadItem thumbUrl]]
                   placeholderImage:[UIImage imageNamed:@"ThreadListPlaceholder"]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    /*
    if (threadItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    */
    
    return cell;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return RANCHAN_LIST_CELL_HEIGHT;
}
*/
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
