//
//  MainViewController.h
//  DrawMyStickers
//
//  Created by Pottt on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView.h"
#import "DrawingInfo.h"
#import "LineWidthView.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet DrawingView *drawingView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) DrawingInfo *drawingInfo;
@property (strong, nonatomic) LineWidthView *lineWidthView;


- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)sliderTouched:(UISlider *)sender;
- (IBAction)clearDrawing:(UIBarButtonItem *)sender;
- (IBAction)sliderTouchUpInside:(UISlider *)sender;
- (BOOL)saveDrawing;

@end

