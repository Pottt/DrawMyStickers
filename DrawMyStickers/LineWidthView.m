//
//  LineWidthView.m
//  DrawMyStickers
//
//  Created by betaman on 20/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "LineWidthView.h"

@implementation LineWidthView




- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.lineWidth = 1.0;
    }
    return self;
    
}



- (void)drawRect:(CGRect)rect {
    
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self setAlpha:0.8];
    [[UIColor purpleColor] set];
    
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:20.0];
    [rectPath fill];
    
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:center radius:self.lineWidth / 2.0 startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
    [[UIColor whiteColor] set];
    [circle fill];
    
}


@end
