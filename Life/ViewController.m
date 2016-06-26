//
//  ViewController.m
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "ViewController.h"
#import "LFGridView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = self.view.frame.size.width;
    LFGridView* gridView = [[LFGridView alloc] initWithFrame:CGRectMake(0, 0, width, width) gridLength:20];
    gridView.center = self.view.center;
    [self.view addSubview:gridView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
