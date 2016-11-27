//
//  DrawingView.m
//  DrawMyStickers
//
//  Created by betaman on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

// Initializers

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if(self) {
        self.pathToDraw = [[UIBezierPath alloc] init];
        self.backgroundDrawingImage = [[UIImage alloc] init];
        self.pathColor = [UIColor blackColor];
    }
        
    return self;
}


- (void)drawRect:(CGRect)rect {
  
  
    [self.backgroundDrawingImage drawInRect:rect];
    [self.pathColor set];
    [self.pathToDraw stroke];
    
}

- (void)clearView {
    // Removes all drawing inside view
    
    UIGraphicsBeginImageContext(self.bounds.size);
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:self.bounds];
    [self.backgroundColor set];
    [rectPath fill];
   
    self.backgroundDrawingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
}

- (void)saveContext {
    //assigns drawing to backgroundDrawingImage
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.backgroundDrawingImage drawInRect:self.bounds];
    [self.pathColor set];
    [self.pathToDraw stroke];

    self.backgroundDrawingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}



@end
