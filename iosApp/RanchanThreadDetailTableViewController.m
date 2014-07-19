//
//  RanchanThreadDetailTableViewController.m
//  iosApp
//
//  Created by John Arley Burns on 18/07/14.
//  Copyright (c) 2014 Chanapps Software LLC. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "RanchanThreadDetailTableViewController.h"
#import "RanchanThreadItem.h"
#import "RanchanTestHarness.h"
#import "RanchanAddThreadItemViewController.h"

@interface RanchanThreadDetailTableViewController ()

@property NSMutableArray *detailItems;
@property NSDictionary *offscreenCells;

@end

@implementation RanchanThreadDetailTableViewController

static NSString *CellIdentifier = @"ThreadDetailPrototypeCell";

- (void)loadInitialData {
    [[RanchanTestHarness sharedManager] addDetailItems:self.detailItems];
}

- (IBAction)unwindToList:(UIStoryboardSegue*) segue
{
    RanchanAddThreadItemViewController *source = [segue sourceViewController];
    RanchanThreadItem *item = source.threadItem;
    if (item != nil) {
        [self.detailItems addObject:item];
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
    
    self.detailItems = [[NSMutableArray alloc] init];
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
    return [self.detailItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    RanchanThreadItem *threadItem = [self.detailItems objectAtIndex:indexPath.row];
    
    UILabel *contentLabel = (UILabel *)[cell viewWithTag:101];
    if (threadItem.content && threadItem.content != (id)[NSNull null]) {
        contentLabel.text = threadItem.content;
    }
    else {
        contentLabel.text = @"";
    }
    //[contentLabel sizeToFit];
    
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
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:102];
    if (threadItem.nickname && threadItem.nickname != (id)[NSNull null]) {
        detailLabel.text = [NSString stringWithFormat:@"%@ ~ %@", dateText, threadItem.nickname];
    }
    else {
        detailLabel.text = dateText;
    }
    //[detailLabel sizeToFit];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.layer.cornerRadius = 5;
    imageView.layer.masksToBounds = YES;
    
    [imageView setImageWithURL:[NSURL URLWithString:[threadItem thumbUrl]]
              placeholderImage:[UIImage imageNamed:@"ThreadListPlaceholder"]];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Use a dictionary of offscreen cells to get a cell for the reuse identifier, creating a cell and storing
    // it in the dictionary if one hasn't already been added for the reuse identifier.
    // WARNING: Don't call the table view's dequeueReusableCellWithIdentifier: method here because this will result
    // in a memory leak as the cell is created but never returned from the tableView:cellForRowAtIndexPath: method!
    UITableViewCell *cell = [self.offscreenCells objectForKey:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
        [self.offscreenCells setValue:cell forKey:CellIdentifier];
    }
    
    // Configure the cell with content for the given indexPath, for example:
    // cell.textLabel.text = someTextForThisCell;
    // ...
    
    // Make sure the constraints have been set up for this cell, since it may have just been created from scratch.
    // Use the following lines, assuming you are setting up constraints from within the cell's updateConstraints method:
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    // Set the width of the cell to match the width of the table view. This is important so that we'll get the
    // correct cell height for different table view widths if the cell's height depends on its width (due to
    // multi-line UILabels word wrapping, etc). We don't need to do this above in -[tableView:cellForRowAtIndexPath]
    // because it happens automatically when the cell is used in the table view.
    // Also note, the final width of the cell may not be the width of the table view in some cases, for example when a
    // section index is displayed along the right side of the table view. You must account for the reduced cell width.
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints.
    // (Note that you must set the preferredMaxLayoutWidth on multi-line UILabels inside the -[layoutSubviews] method
    // of the UITableViewCell subclass, or do it manually at this point before the below 2 lines!)
    UILabel *contentLabel = (UILabel *)[cell viewWithTag:101];
    contentLabel.preferredMaxLayoutWidth = cell.frame.size.width;
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell's contentView
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 105.0f;
    
    return height;
}

// NOTE: Set the table view's estimatedRowHeight property instead of implementing the below method, UNLESS
// you have extreme variability in your row heights and you notice the scroll indicator "jumping" as you scroll.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Do the minimal calculations required to be able to return an estimated row height that's
    // within an order of magnitude of the actual height.
    // For example:
    //if ([self isTallCellAtIndexPath:indexPath]) {
    //    return 350.0f;
    //} else {
        return 104.0f;
    //}
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
    RanchanThreadItem *tappedItem = [self.detailItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
