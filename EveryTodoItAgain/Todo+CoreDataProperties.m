//
//  Todo+CoreDataProperties.m
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright © 2015 Steve. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Todo+CoreDataProperties.h"

@implementation Todo (CoreDataProperties)

@dynamic todoTitle;
@dynamic todoDescription;
@dynamic todoPriority;
@dynamic isCompleted;
@dynamic todoFinishBy;

@end
