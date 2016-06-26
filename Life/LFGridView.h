//
//  LFGridView.h
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFGridCell.h"

@interface LFGridView : UIView
-(instancetype)initWithFrame:(CGRect)frame gridLength:(NSUInteger)length;
-(void)tick;
@end
