//
//  LFGridCell.h
//  Life
//
//  Created by Phillip Tennen on 6/25/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFGridCell : UIView
@property (nonatomic, assign) BOOL filled;
-(instancetype)initWithLength:(CGFloat)length;
@end
