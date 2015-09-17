//
//  EditViewController.m
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright © 2015 Steve. All rights reserved.
//

#import "EditViewController.h"
#import "DataStack.h"


@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISwitch *switchIsComplete;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.todo.isCompleted) {
        [self.switchIsComplete setOn:YES];
    } else {
        [self.switchIsComplete setOn:NO];
    }
    
}

- (IBAction)doneButton:(UIButton *)sender {
    
    self.todo.todoTitle = self.titleTextField.text;
    self.todo.todoPriority = [self.priorityTextField.text intValue];
    self.todo.todoDescription = self.descriptionTextField.text;
    self.todo.isCompleted = self.switchIsComplete.on;
    
    
    self.todo.todoFinishBy = self.datePicker.date;
    
    NSError *saveError = nil;
    
    if (![self.dataStack.context save:&saveError]) {
        NSLog(@"Save failed! %@", saveError);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)datePicker:(UIDatePicker *)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];

}

@end
