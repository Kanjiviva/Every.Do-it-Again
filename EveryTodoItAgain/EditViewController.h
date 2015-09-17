//
//  EditViewController.h
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright © 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "DataStack.h"

@interface EditViewController : UIViewController

@property (nonatomic) Todo *todo;

@property (nonatomic) DataStack *dataStack;

@end
