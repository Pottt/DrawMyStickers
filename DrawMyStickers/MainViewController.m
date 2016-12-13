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
  
    self.stickerArray = [[NSMutableArray alloc] init];
    
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
    
//    ColorPickerView *colorPickerView = [[ColorPickerView alloc] init];
//    UIViewController *popVC = [[UIViewController alloc] init];
//    [popVC setView:colorPickerView];
//    [popVC setModalPresentationStyle:UIModalPresentationPopover];
//    [self presentViewController:popVC animated:YES completion:nil];
//    
//    UIPopoverPresentationController *popover = [popVC popoverPresentationController];
//    [popover setDelegate:self];
//    popover.sourceView = sender.customView;
//    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    popover.sourceRect = CGRectMake(20, 20, 100, 100);
  
//    ColorPickerView *colorPickerView = [[ColorPickerView alloc] init];
//    PopViewController *popVC = [[PopViewController alloc] init];
//    [popVC setView:colorPickerView];
//    [popVC setModalPresentationStyle:UIModalPresentationPopover];
//    [self presentViewController:popVC animated:YES completion:nil];
//    
//    UIPopoverPresentationController *popover = [popVC popoverPresentationController];
//    [popover setDelegate:self];
//    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    popover.sourceView = sender.customView;
//
    
    
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
    
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [docsPath stringByAppendingPathComponent:@"drawingInfo"];
    
    return filename;
}

-(void)saveDrawing {
    // archive DrawingView to archivePath
    
    NSData *data = UIImagePNGRepresentation(self.drawingView.backgroundDrawingImage);
    NSString *imagePath = [[self archivePath] stringByAppendingString:@"ImagePath"];
    [data writeToFile:imagePath atomically:YES];
   
}

- (void)setBackgroundImageSize {
    // Resize Background Image to a correct size for MSSticker
    
    UIImage *backgroundImage = [self.drawingView backgroundDrawingImage];
    CGSize originalImageSize = backgroundImage.size;
    CGRect newRect = CGRectMake(0, 0, 300, 300);
    
    float ratio = MAX(newRect.size.width / originalImageSize.width, newRect.size.height / originalImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:newRect];
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [backgroundImage drawInRect:projectRect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *data = UIImagePNGRepresentation(smallImage);
    
    UIGraphicsEndImageContext();

    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    NSString *key = (__bridge NSString *)newUniqueIDString;
    
    CFRelease(newUniqueID);
    CFRelease(newUniqueIDString);
    
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [docsPath stringByAppendingPathComponent:key];
    
    [data writeToFile:filename atomically:YES];
    NSURL *pathURL = [NSURL URLWithString:filename];
    
    MSSticker *sticker = [[MSSticker alloc] initWithContentsOfFileURL:pathURL localizedDescription:@"" error:nil];
    
    [self.stickerArray addObject:sticker];
    
       
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

// MARK: UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"popoverSegue"]) {
        
        UINavigationController *destNav = segue.destinationViewController;
        ColorPickerView *colorPickerView = [[ColorPickerView alloc] init];
        [destNav setView:colorPickerView];
        
        UIPopoverPresentationController *popVC = destNav.popoverPresentationController;
        popVC.permittedArrowDirections = UIPopoverArrowDirectionAny;
        popVC.sourceRect = CGRectMake(0, 0, 100, 100);
        popVC.delegate = self;
        
    }
    
}

@end
