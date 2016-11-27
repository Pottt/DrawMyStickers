//
//  DrawingInfo.m
//  DrawMyStickers
//
//  Created by betaman on 12/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "DrawingInfo.h"

@implementation DrawingInfo

// NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    UIBezierPath *bezierPath = [aDecoder decodeObjectForKey:@"bezierPath"];
    UIColor *pathColor = [aDecoder decodeObjectForKey:@"pathColor"];
   
    return [self init:bezierPath withColor:pathColor];
    
}

- (instancetype)init:(UIBezierPath *)bezierPath withColor:(UIColor *)pathColor {
    
    self = [super init];
    if(self) {
        self.bezierPath = bezierPath;
        self.pathColor = pathColor;
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.bezierPath forKey:@"bezierPath"];
    [aCoder encodeObject:self.pathColor forKey:@"pathColor"];
    
}



@end
