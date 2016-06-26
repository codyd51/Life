//
//  LFGridView.m
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "LFGridView.h"

@interface LFGridView () {
    NSUInteger _gridLength;
    NSArray<NSMutableArray<LFGridCell*>*>* _cells;
}
@end

@implementation LFGridView
-(instancetype)initWithFrame:(CGRect)frame gridLength:(NSUInteger)length {
    if ((self = [super initWithFrame:frame])) {
        _gridLength = length;
        
        //initialize cells array
        NSMutableArray* cells = [NSMutableArray arrayWithCapacity:length];
        for (int i = 0; i < length; i++) {
            [cells addObject:[NSMutableArray arrayWithCapacity:length]];
        }
        _cells = [NSArray arrayWithArray:cells];
        
        CGFloat cellLength = MIN(frame.size.width, frame.size.height) / length;
        //create a square grid of these cells
        for (int row = 0; row < length; row++) {
            for (int col = 0; col < length; col++) {
                LFGridCell* cell = [[LFGridCell alloc] initWithLength:cellLength];
                CGPoint origin = CGPointMake(col * cellLength, row * cellLength);
                cell.frame = CGRectMake(origin.x, origin.y, cell.frame.size.width, cell.frame.size.height);
                [self addSubview:cell];
                
                //insert cell into cells array
                _cells[row][col] = cell;
            }
        }
    }
    return self;
}
-(LFGridCell*)cellAtRow:(NSUInteger)row col:(NSUInteger)col {
    if (row > _gridLength || col > _gridLength) return nil;
    
    //NSUInteger index = (col * _gridLength) + row;
    return _cells[col][row];
}
-(NSArray<NSMutableArray<NSNumber*>*>*)gameState {
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:_gridLength];
    for (int i = 0; i < _gridLength; i++) {
        [ret addObject:[NSMutableArray arrayWithCapacity:_gridLength]];
    }
    
    //look at every cell and record whether it's filled or not
    for (int row = 0; row < _gridLength; row++) {
        for (int col = 0; col < _gridLength; col++) {
            LFGridCell* cell = [self cellAtRow:row col:col];
            ret[row][col] = [NSNumber numberWithBool:cell.filled];
        }
    }
    
    return [NSArray arrayWithArray:ret];
}
-(void)setGameState:(NSArray<NSMutableArray<NSNumber*>*>*)state {
    //look at every cell in state and update the corresponding cell accordingly
    for (int row = 0; row < _gridLength; row++) {
        for (int col = 0; col < _gridLength; col++) {
            LFGridCell* cell = [self cellAtRow:row col:col];
            cell.filled = ((NSNumber*)state[row][col]).boolValue;
        }
    }
}
-(void)tick {
    NSArray<NSMutableArray<NSNumber*>*>* gameState = [self gameState];
    NSArray<NSMutableArray<NSNumber*>*>* newState = [self gameState];
    
    //for every cell that's on, also turn on every cell to the right
    for (int row = 0; row < _gridLength; row++) {
        for (int col = 0; col < _gridLength; col++) {
            if (gameState[row][col].boolValue) {
                if (row > 0) newState[row - 1][col] = @YES;
                if (row < _gridLength - 1) newState[row + 1][col] = @YES;
                
                if (col > 0) newState[row][col - 1] = @YES;
                if (col < _gridLength - 1) newState[row][col + 1] = @YES;
            }
        }
    }
    
    //set new game state
    [self setGameState:newState];
}
@end
