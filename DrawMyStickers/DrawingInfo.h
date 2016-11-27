//
//  DrawingInfo.h
//  DrawMyStickers
//
//  Created by betaman on 12/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DrawingInfo : NSObject <NSCoding>

@property(strong, nonatomic) UIBezierPath *bezierPath;
@property(strong, nonatomic) UIImage *backgroundImage;
@property(strong, nonatomic) UIColor *pathColor;

@end
