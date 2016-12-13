//
//  MainViewController.h
//  DrawMyStickers
//
//  Created by Pottt on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView.h"
#import "LineWidthView.h"
#import "ColorPickerView.h"
#import "PopViewController.h"
#import <Messages/Messages.h>

@interface MainViewController : UIViewController <UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet DrawingView *drawingView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) LineWidthView *lineWidthView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *brushButton;
@property (strong, nonnull) NSMutableArray *stickerArray;


- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)sliderTouched:(UISlider *)sender;
- (IBAction)clearDrawing:(UIBarButtonItem *)sender;
- (IBAction)brushTouched:(UIBarButtonItem *)sender;
- (IBAction)sliderTouchUpInside:(UISlider *)sender;
- (void)saveDrawing;
- (void)setBackgroundImageSize;

@end

