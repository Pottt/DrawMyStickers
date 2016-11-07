//
//  MainViewController.h
//  DrawMyStickers
//
//  Created by Pottt on 07/11/2016.
//  Copyright © 2016 Jerome Pottier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingView.h"
#import "DrawingPath.h"

@interface MainViewController : UIViewController

//@property(strong, nonatomic) DrawingPath *path;
@property (weak, nonatomic) IBOutlet DrawingView *drawingView;


- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)clearDrawing:(UIBarButtonItem *)sender;

@end

