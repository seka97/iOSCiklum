//
//  Store.h
//  TextStore
//
//  Created by Admin on 14.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol StoreDelegate <NSObject>

-(void)Delete;
-(void)Add;

@end

@interface Store : NSObject

@property(nonatomic,assign)id<StoreDelegate> delegate;


-(void)doDelete;
-(void)doAdd;
@end
