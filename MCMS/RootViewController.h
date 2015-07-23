//
//  ViewController.h
//  MCMS
//
//  Created by Rachel Schneebaum on 7/21/15.
//  Copyright (c) 2015 Rachel Schneebaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

