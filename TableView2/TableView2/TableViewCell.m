//
//  TableViewCell.m
//  TableView2
//
//  Created by Admin on 20.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//
#import "TableViewCell.h"

@implementation TableViewCell

-(void)fillWithObject:(id)object
{
    self.label.text = object;
    self.image.image = [UIImage imageNamed:@"Sun"];
}

-(void)prepareForReuse
{
    self.image.image = nil;
}
@end
