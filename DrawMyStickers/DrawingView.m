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
        self.backgroundDrawingImage = [[UIImage alloc] init];
    }
        
    return self;
}



- (void)drawRect:(CGRect)rect {
  
  
    [self.backgroundDrawingImage drawInRect:rect];
    [[UIColor orangeColor] set];
    [self.pathToDraw stroke];
        
}

- (void)clearView {
    
    UIGraphicsBeginImageContext(self.bounds.size);
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:self.bounds];
    [self.backgroundColor set];
    [rectPath fill];
   
    self.backgroundDrawingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
}

- (void)saveContext {
    
    
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.backgroundDrawingImage drawInRect:self.bounds];
    [[UIColor orangeColor] set];
    [self.pathToDraw stroke];

    self.backgroundDrawingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}



@end
