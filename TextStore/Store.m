//
//  Store.m
//  TextStore
//
//  Created by Admin on 14.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "Store.h"

@implementation Store
@synthesize delegate;
-(void)doDelete
{
    if (delegate && [delegate respondsToSelector:@selector(Delete)])
    {
        [delegate performSelector:@selector(Delete)];
    }
}
-(void)doAdd
{
    if (delegate && [delegate respondsToSelector:@selector(Add)])
    {
        [delegate performSelector:@selector(Add)];
    }
}


@end