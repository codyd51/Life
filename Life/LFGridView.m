//
//  LFGridView.m
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "LFGridView.h"

#define CELL_LENGTH [LFGridCell defaultLength];

@implementation LFGridView
-(instancetype)initWithFrame:(CGRect)frame gridLength:(NSUInteger)length {
    if ((self = [super initWithFrame:frame])) {
        CGFloat cellLength = MIN(frame.size.width, frame.size.height) / length;
        //create a square grid of these cells
        for (int row = 0; row < length; row++) {
            for (int col = 0; col < length; col++) {
                LFGridCell* cell = [[LFGridCell alloc] initWithLength:cellLength];
                CGPoint origin = CGPointMake(col * cellLength, row * cellLength);
                cell.frame = CGRectMake(origin.x, origin.y, cell.frame.size.width, cell.frame.size.height);
                [self addSubview:cell];
            }
        }
    }
    return self;
}
@end
