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
    
    
    
    [self initLineWidthView];
  
    NSString *imagePath = [[self archivePath] stringByAppendingString:@"ImagePath"];
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    self.drawingView.backgroundDrawingImage = [UIImage imageWithData:data];
    
    self.drawingView.pathToDraw = [[UIBezierPath alloc] init];
    
    self.drawingView.pathColor = [UIColor blackColor];
    
    [self.drawingView setNeedsDisplay];
    
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    [self.drawingView.pathToDraw setLineWidth:sender.value];
    [self.lineWidthView setLineWidth:sender.value];
    [self.lineWidthView setNeedsDisplay];
    
    
}

- (IBAction)sliderTouched:(UISlider *)sender {
    
    [self.lineWidthView setHidden:NO];
}

- (IBAction)clearDrawing:(UIBarButtonItem *)sender {
    
    [self.drawingView.pathToDraw removeAllPoints];
    [self.drawingView clearView];
    [self.drawingView setNeedsDisplay];
    
}

- (IBAction)brushTouched:(UIBarButtonItem *)sender {
}

- (IBAction)sliderTouchUpInside:(UISlider *)sender {
    
    [self.lineWidthView setHidden:YES];
}
- (IBAction)sliderTouchUpOutside:(UISlider *)sender {
    [self sliderTouchUpInside:sender];
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

// NSCoding

-(NSString *)archivePath {
    // Returns a string representing the absolute path for archiving drawing
    
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [docsPath stringByAppendingPathComponent:@"drawingInfo"];
    
    return filename;
}

-(void)saveDrawing {
    // archive DrawingView to archivePath
    
    NSData *data = UIImagePNGRepresentation(self.drawingView.backgroundDrawingImage);
    NSString *imagePath = [[self archivePath] stringByAppendingString:@"ImagePath"];
    [data writeToFile:imagePath atomically:YES];
   
}

// MARK: LineWidthView management

- (void)initLineWidthView {
    
    CGFloat lineWidthToDraw = self.slider.value;
    CGRect frame = CGRectMake((self.view.frame.size.width - 100) / 2.0, (self.view.frame.size.height - 100) / 2.0, 100.0, 100.0);
    
    
    self.lineWidthView = [[LineWidthView alloc] initWithFrame:frame];
    [self.lineWidthView setLineWidth:lineWidthToDraw];
    [self.lineWidthView setHidden:YES];
    
    [self.view addSubview:self.lineWidthView];
    
}

@end
