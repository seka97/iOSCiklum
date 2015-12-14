//
//  ViewController.h
//  TextStore
//
//  Created by Admin on 14.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

@interface ViewController : UIViewController<StoreDelegate>

@property Store* store;
@property int size;


@end

