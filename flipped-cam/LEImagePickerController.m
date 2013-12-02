//
//  LEImagePickerController.m
//  flipped-cam
//
//  Created by Lucas Eduardo  Chaves Frota on 14/07/13.
//  Copyright (c) 2013 Lucas Eduardo Chaves Frota. All rights reserved.
//

#import "LEImagePickerController.h"


#pragma mark - CameraOverlayView

@interface CameraOverlay : UIView <UIAccelerometerDelegate>

@property(nonatomic, assign) UIInterfaceOrientation interfaceOrientation;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, weak) UIImagePickerController *teste;

@end

@implementation CameraOverlay

- (id)initWithFrame:(CGRect)frame andPicker:(UIImagePickerController*)teste
{
    self = [super initWithFrame:frame];
    if (self) {
        self.teste = teste;
        
         _interfaceOrientation = UIInterfaceOrientationPortrait;
        _button = [[UIButton alloc] initWithFrame:CGRectMake( 240.0f, 0.0f, 80.0f, 80.0f )];
        [_button setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_button];
        
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    }
    return self;
}


-(void)dealloc;
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

- (void)layoutSubviews;
{
    CGFloat width = CGRectGetWidth( self.button.frame );
    CGFloat height = CGRectGetHeight( self.button.frame );
    
    switch ( self.interfaceOrientation )
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
            self.button.frame = CGRectMake( CGRectGetMaxX( self.bounds ) - width, 0.0f, width, height );
            break;
        case UIInterfaceOrientationLandscapeRight:
            self.button.frame = CGRectMake( CGRectGetMaxX( self.bounds ) - width, CGRectGetMaxY( self.bounds ) - height - 50.0f, width, height );
            break;
        case UIInterfaceOrientationLandscapeLeft:
            self.button.frame = CGRectMake( 0.0f, 0.0f, width, height );
            break;
    }
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
{
	CGFloat x = -[acceleration x];
	CGFloat y = [acceleration y];
	CGFloat angle = atan2(y, x);
    
	if ( angle >= -2.25f && angle <= -0.25f )
	{
        self.interfaceOrientation = UIInterfaceOrientationPortrait;
	}
	else if ( angle >= -1.75f && angle <= 0.75f )
	{
        self.interfaceOrientation = UIInterfaceOrientationLandscapeRight;
	}
	else if( angle >= 0.75f && angle <= 2.25f )
	{
        self.interfaceOrientation = UIInterfaceOrientationPortraitUpsideDown;
	}
	else if ( angle <= -2.25f || angle >= 2.25f )
	{
        self.interfaceOrientation = UIInterfaceOrientationLandscapeLeft;
	}
}



- (void)setInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    if ( _interfaceOrientation != interfaceOrientation )
    {
        _interfaceOrientation = interfaceOrientation;
        [self setNeedsLayout];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;
{
    if ( [super hitTest:point withEvent:event] == self.button )
        return self.button;
    
    return nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;
{
    if ( CGRectContainsPoint( self.button.frame, point ) )
        return YES;
    
    return NO;
}


@end


#pragma mark - LEImagePickerController implementation

@implementation LEImagePickerController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CameraOverlay *view = [[CameraOverlay alloc] initWithFrame:self.view.frame andPicker:self];
    [view.button addTarget:self action:@selector(flipCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.cameraOverlayView = view;
        self.cameraViewTransform = CGAffineTransformScale(self.cameraViewTransform, -1, 1);
    }
	// Do any additional setup after loading the view.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)flipCamera:(id)sender {

    if (!_cameraFlipping)
    {
        _cameraFlipping = YES;
        [self performSelectorInBackground:@selector(switchCameraDevice) withObject:nil];
        [self performSelector:@selector(flipAnimation) withObject:nil afterDelay:0.4f];
    }
}

-(void)flipAnimation
{
    [UIView transitionWithView:self.view duration:0.9 options:UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        self.cameraViewTransform = CGAffineTransformScale(self.cameraViewTransform, -1, 1);

    } completion:^(BOOL finished) {
        if (finished) {
            _cameraFlipping = NO;
        }
    }];

}

-(void)switchCameraDevice
{
    if(self.cameraDevice == UIImagePickerControllerCameraDeviceFront)
    {
        self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    else
    {
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
}

@end
