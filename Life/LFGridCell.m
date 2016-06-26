//
//  LFGridCell.m
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "LFGridCell.h"

@implementation LFGridCell
-(instancetype)initWithLength:(CGFloat)length {
    if ((self = [super initWithFrame:CGRectMake(0, 0, length, length)])) {
        self.filled = NO;
        
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0].CGColor;
        
        UIButton* fillButton = [UIButton buttonWithType:UIButtonTypeCustom];
        fillButton.frame = self.frame;
        [fillButton addTarget:self action:@selector(fillButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:fillButton];
    }
    return self;
}
-(void)fillButtonPressed:(UIButton*)sender {
    self.filled = !self.filled;
}
-(void)setFilled:(BOOL)filled {
    _filled = filled;
    if (filled) {
        self.backgroundColor = [UIColor blackColor];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
    }
}
@end
