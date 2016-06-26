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
    BOOL _gameRunning;
    NSTimer* _gameLoop;
}
@end

@implementation ViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor* skyBlue = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    UIColor* lightPurple = [UIColor colorWithRed:250.0/255.0 green:180.0/255.0 blue:135.0/255.0 alpha:1.0];
    self.view.backgroundColor = skyBlue;
    
    CGFloat width = self.view.frame.size.width;
    _gridView = [[LFGridView alloc] initWithFrame:CGRectMake(0, self.view.center.y / 1.75, width, width) gridLength:20];
    [self.view addSubview:_gridView];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _gridView.frame.origin.y)];
    titleLabel.center = CGPointMake(self.view.center.x, titleLabel.frame.size.height / 2);
    titleLabel.text = @"Conway's Game of Life";
    titleLabel.numberOfLines = 2;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:50];
    [self.view addSubview:titleLabel];
    
    UIButton* start = [UIButton buttonWithType:UIButtonTypeSystem];
    [start setTitle:@"Start" forState:UIControlStateNormal];
    [start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    start.titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:start.titleLabel.font.pointSize * 1.5];
    start.frame = CGRectMake(0, _gridView.frame.origin.y + _gridView.frame.size.height, self.view.frame.size.width, self.view.frame.size.width / 8);
    start.backgroundColor = lightPurple;
    [start addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
}
-(void)startButtonPressed:(UIButton*)sender {
    if (!_gameRunning) {
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        _gridView.userInteractionEnabled = NO;
        
        _gameLoop = [NSTimer scheduledTimerWithTimeInterval:0.25 target:_gridView selector:@selector(tick) userInfo:nil repeats:YES];
        _gameRunning = YES;
    }
    else {
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        _gridView.userInteractionEnabled = YES;
        
        [_gameLoop invalidate];
        _gameRunning = NO;
    }
}
@end
