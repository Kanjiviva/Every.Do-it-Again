//
//  DetailViewController.h
//  EveryTodoItAgain
//
//  Created by Steve on 2015-09-16.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@class DataStack;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;

@property (nonatomic) DataStack *dataStack;


@end

