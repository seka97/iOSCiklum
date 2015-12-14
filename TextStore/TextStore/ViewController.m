//
//  ViewController.m
//  TextStore
//
//  Created by Admin on 14.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *TV;
@property (weak, nonatomic) IBOutlet UITextField *Edit;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _store = [Store new];
    _store.delegate=self;
    _size=0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Add
{
    NSString* string = [NSString new];
    string = _Edit.text;
    _TV.text = [_TV.text stringByAppendingString:@"\n"];
    _TV.text = [_TV.text stringByAppendingString:string];
    _size++;
}

-(void)Delete
{
    
    if(_size>0)
    {
        NSRange range = [_TV.text rangeOfString: @"\n" options: NSBackwardsSearch];
        _TV.text=[_TV.text substringToIndex:range.location];
        _size--;
    }
}
- (IBAction)butAdd:(id)sender
{
    [_store doAdd];
}
- (IBAction)butDel:(id)sender
{
    [_store doDelete];
}

@end
