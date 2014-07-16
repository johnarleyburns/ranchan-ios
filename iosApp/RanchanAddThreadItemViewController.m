//
//  RanchanAddThreadItemViewController.m
//  ThreadList
//
//  Created by John Arley Burns on 10/07/14.
//  Copyright (c) 2014 John Arley Burns. All rights reserved.
//

#import "RanchanAddThreadItemViewController.h"

@interface RanchanAddThreadItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation RanchanAddThreadItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) {
        return;
    }
    if (self.textField.text.length > 0) {
        self.threadItem = [[RanchanThreadItem alloc] init];
        self.threadItem.content = self.textField.text;
        self.threadItem.completed = NO;
    }
}

@end
