//
//  TableViewDataSource.h
//  TableView2
//
//  Created by Admin on 20.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableViewDataSourceDelegate <NSObject>

-(void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

@end
@interface TableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<TableViewDataSourceDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *objects;

-(instancetype)initWithTableView:(UITableView *)tableview;


@end
