//
//  ColorPickerView.m
//  DrawMyStickers
//
//  Created by Pottt on 01/12/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "ColorPickerView.h"

@implementation ColorPickerView

- (void)drawRect:(CGRect)rect {
    
    [self setBackgroundColor:[UIColor whiteColor]];
    UIImage *image = [UIImage imageNamed:@"Brush"];
    [image drawInRect:rect];
    
}

@end
