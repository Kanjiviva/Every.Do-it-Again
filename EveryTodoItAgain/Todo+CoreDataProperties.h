//
//  Todo+CoreDataProperties.h
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright © 2015 Steve. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Todo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *todoTitle;
@property (nullable, nonatomic, retain) NSString *todoDescription;
@property (nonatomic) int16_t todoPriority;
@property (nonatomic) BOOL isCompleted;
@property (nullable, nonatomic, retain) NSDate *todoFinishBy;

@end

NS_ASSUME_NONNULL_END
