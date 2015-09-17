//
//  DetailViewController.m
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoPriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoIsCompletedLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoDateShouldComplete;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [self configureView];
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = self.detailItem.todoDescription;
        self.todoTitleLabel.text = self.detailItem.todoTitle;
        self.todoPriorityLabel.text = [NSString stringWithFormat:@"%hd", self.detailItem.todoPriority];
        
        if (self.detailItem.isCompleted) {
            self.todoIsCompletedLabel.text = @"YES";
        } else {
            self.todoIsCompletedLabel.text = @"NO";
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
        
        self.todoDateShouldComplete.text = [dateFormatter stringFromDate:self.detailItem.todoFinishBy];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showEditDetail"]) {
        EditViewController *editVC = segue.destinationViewController;
        
        editVC.todo = self.detailItem;
        editVC.dataStack = self.dataStack;
    }
    
    
}

@end
