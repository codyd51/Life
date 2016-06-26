//
//  ViewController.m
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "ViewController.h"
#import "LFGridView.h"

@interface ViewController () {
    LFGridView* _gridView;
}
@end

@implementation ViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = self.view.frame.size.width;
    _gridView = [[LFGridView alloc] initWithFrame:CGRectMake(0, self.view.center.y / 4, width, width) gridLength:10];
    [self.view addSubview:_gridView];
    
    UIButton* start = [UIButton buttonWithType:UIButtonTypeSystem];
    [start setTitle:@"Start" forState:UIControlStateNormal];
    start.frame = CGRectMake(0, 0, self.view.frame.size.width / 4, self.view.frame.size.width / 8);
    start.center = CGPointMake(self.view.center.x, _gridView.frame.origin.y + _gridView.frame.size.height + start.frame.size.height);
    [start addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
}
-(void)startButtonPressed:(UIButton*)sender {
    [_gridView tick];
}
@end
