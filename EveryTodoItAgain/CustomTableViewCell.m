//
//  CustomTableViewCell.m
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright © 2015 Steve. All rights reserved.
//

#import "CustomTableViewCell.h"


@interface CustomTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *isCompletedLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateShouldComplete;

@end

@implementation CustomTableViewCell

- (void)setTodo:(Todo *)todo {
    _todo = todo;
    
    [self setup];
}

- (void)setup {
    self.titleLabel.text = self.todo.todoTitle;
    self.descriptionLabel.text = self.todo.todoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%hd", self.todo.todoPriority];
    
    if (self.todo.isCompleted) {
        self.isCompletedLabel.text = @"Completed";
    } else {
        self.isCompletedLabel.text = @"Not Completed";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];

    self.dateShouldComplete.text = [dateFormatter stringFromDate:self.todo.todoFinishBy];
    
}

@end
