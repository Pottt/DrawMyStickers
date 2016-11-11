//
//  MainViewController.m
//  DrawMyStickers
//
//  Created by Pottt on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.drawingView.pathToDraw = [[UIBezierPath alloc] init];
    [self.drawingView.pathToDraw setLineWidth:10.0];
    
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    [self.drawingView.pathToDraw setLineWidth:sender.value];
    
}

- (IBAction)clearDrawing:(UIBarButtonItem *)sender {
    
    [self.drawingView.pathToDraw removeAllPoints];
    [self.drawingView clearView];
    [self.drawingView setNeedsDisplay];
    
}

// Touch management

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[self drawingView]];
    [self.drawingView.pathToDraw moveToPoint:point];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[self drawingView]];
    [self.drawingView.pathToDraw addLineToPoint:point];
    [self.drawingView setNeedsDisplay];
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[self drawingView]];
    [self.drawingView.pathToDraw addLineToPoint:point];
    [self.drawingView setNeedsDisplay];
    [self.drawingView saveContext];
    
    [self.drawingView.pathToDraw removeAllPoints];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self touchesEnded:touches withEvent:event];
}


@end
