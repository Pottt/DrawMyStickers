//
//  DrawingPath.m
//  DrawMyStickers
//
//  Created by betaman on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "DrawingPath.h"

@implementation DrawingPath

-(instancetype)init {
    self = [super init];
    if(self) {
        self.bezierPath = [[UIBezierPath alloc] init];
    }
    
    return self;
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [self init];
    self.bezierPath = [aDecoder decodeObjectForKey:@"bezierPath"];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:[self bezierPath] forKey:@"bezierPath"];
    
}


@end
