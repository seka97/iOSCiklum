//
//  TableViewDataSource.m
//  TableView2
//
//  Created by Admin on 20.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "TableViewDataSource.h"
#import "TableViewCell.h"

@implementation TableViewDataSource
-(instancetype)initWithTableView:(UITableView *)tableview
{
    NSParameterAssert(tableview);
    
    if (self = [super init]) {
        [self configure:tableview];
        self.objects = [NSMutableArray new];
    }
    return self;
}

-(void)configure:(UITableView *)tableView
{
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    
    [cell fillWithObject:self.objects[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didSelectObject:atIndexPath:)]) {
        [self.delegate didSelectObject:self.objects[indexPath.row] atIndexPath:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

@end
