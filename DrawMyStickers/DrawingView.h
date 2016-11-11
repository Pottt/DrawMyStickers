//
//  DrawingView.h
//  DrawMyStickers
//
//  Created by betaman on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView

@property (strong, nonatomic) UIBezierPath *pathToDraw;
@property (strong, nonatomic) UIImage *backgroundDrawingImage;

- (void) clearView;
- (void) saveContext;

@end
