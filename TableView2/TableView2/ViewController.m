//
//  ViewController.m
//  TableView2
//
//  Created by Admin on 20.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"

@interface ViewController () <TableViewDataSourceDelegate>

@property (nonatomic, strong) UIView *top;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, strong) TableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewConttroller];
    [self setTableView];
}

-(void)setViewConttroller
{
    self.top = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self
               action:@selector(addObject:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    button.frame = CGRectMake(200.0, 10.0, 80.0, 40.0);
    [self.top addSubview:button];
    
    self.field = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, 190.0, 40.0)];
    self.field.placeholder = @"Enter text";
    [self.top addSubview:self.field];

    self.top.backgroundColor = [UIColor whiteColor];
    self.view = self.top;
}

-(void)setTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 50.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50.0) style:UITableViewStylePlain];
    [self.top addSubview:self.tableView];
    self.dataSource = [[TableViewDataSource alloc] initWithTableView:self.tableView];
    self.dataSource.delegate = self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addObject:(id)object
{
    [self.dataSource.objects addObject:self.field.text];
    [self.tableView reloadData];
}

-(void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
    [self.dataSource.objects removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];    
}

@end
