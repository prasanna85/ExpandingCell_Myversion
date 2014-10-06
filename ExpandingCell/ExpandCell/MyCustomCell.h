//
//  MyCustomCell.h
//  ExpandingCellTable
//
//  Created by Mitul Bhadesiya on 29/01/14.
//  Copyright (c) 2014 logistic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell <UITableViewDataSource , UITableViewDelegate>

@property (strong , nonatomic)IBOutlet UILabel *label;
@property (strong  , nonatomic)IBOutlet UITableView *cellTable;

@property (strong , nonatomic) NSMutableArray *DetailArray;

@end
