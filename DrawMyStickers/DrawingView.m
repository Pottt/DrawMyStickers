//
//  DrawingView.m
//  DrawMyStickers
//
//  Created by betaman on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if(self) {
        self.pathToDraw = [[UIBezierPath alloc] init];
//        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] setStroke];
    [self.pathToDraw stroke];
    
    
}

@end
