//
//  TableViewCell.h
//  TableView2
//
//  Created by Admin on 20.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseTableViewCell <NSObject>

-(void)fillWithObject:(id)object;

@end

@interface TableViewCell : UITableViewCell <BaseTableViewCell>
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
