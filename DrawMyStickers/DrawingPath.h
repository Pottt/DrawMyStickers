//
//  DrawingPath.h
//  DrawMyStickers
//
//  Created by betaman on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DrawingPath : NSObject <NSCoding>

@property(nonatomic) UIBezierPath *bezierPath;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

@end
