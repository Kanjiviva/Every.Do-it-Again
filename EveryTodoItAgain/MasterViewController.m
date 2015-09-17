//
//  MasterViewController.m
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"

#import "DataStack.h"
#import "Todo.h"

@interface MasterViewController ()

@property (nonatomic) DataStack *dataStack;

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.dataStack = [DataStack new];
    
    [self reloadTodos];
}

- (void)viewWillAppear:(BOOL)animated {
    [self reloadTodos];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    
    Todo *todo = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:self.dataStack.context];
    
    NSDate *today = [NSDate new];
    
    todo.todoFinishBy = today;
    
    todo.todoTitle = @"Test";
    todo.todoPriority = 1;
    todo.todoDescription = @"Default Text";
    todo.isCompleted = YES;

    NSError *saveError = nil;
    
    
    if (![self.dataStack.context save:&saveError]) {
        
        NSLog(@"Save failed! %@", saveError);
    }
    
    [self reloadTodos];
    
    
}


-(void)reloadTodos {
    
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Todo"];
    
    fetch.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"todoTitle" ascending:YES]];
    
    NSError *fetchError = nil;
    NSArray *allTodos = [self.dataStack.context executeFetchRequest:fetch error:&fetchError];
    
    NSLog(@"all todo lists are: %@", allTodos);
    
    self.objects = [allTodos mutableCopy];
    
    [self.tableView reloadData];
}
#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
        [[segue destinationViewController] setDataStack:self.dataStack];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *object = self.objects[indexPath.row];
    cell.todo = object;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Todo *todo = self.objects[indexPath.row]; // same as: [self.objects objectAtIndex:indexPath.row];
        
        [self.dataStack.context deleteObject:todo];
        
        NSError *saveError = nil;
        
        if (![self.dataStack.context save:&saveError]) {
            NSLog(@"Save failed! %@", saveError);
        }
        
        [self.objects removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (IBAction)swipeToComplete:(UISwipeGestureRecognizer *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:[sender locationInView:self.tableView]];
    
    Todo *todo = self.objects[indexPath.row];
    
    if (!todo.isCompleted) {
        todo.isCompleted = YES;
        [self.tableView reloadData];
    } else {
        NSLog(@"Its already Completed");
    }
    
}

@end
