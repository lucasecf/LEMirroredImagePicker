//
//  LEMirroredImagePicker.m
//  LEMirroredImagePicker
//
//  Created by Lucas Eduardo on 05/21/2015.
//  Copyright (c) 2014 Lucas Eduardo. All rights reserved.
//

#import "LEMirroredImagePicker.h"

@interface LEMirroredImagePicker()

@end


@implementation LEMirroredImagePicker

- (id)initWithImagePicker:(UIImagePickerController*)pickerController
{
    self = [super init];
    if (self) {
        _imagePickerController = pickerController;
    }
    return self;
}


-(void)mirrorFrontCamera
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cameraChanged:)
                                                 name:@"AVCaptureDeviceDidStartRunningNotification"
                                               object:nil];

}


-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AVCaptureDeviceDidStartRunningNotification" object:nil];
}


#pragma mark - private methods

- (void)cameraChanged:(NSNotification *)notification
{
    if(self.imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceFront)
    {
        self.imagePickerController.cameraViewTransform = CGAffineTransformIdentity;
        self.imagePickerController.cameraViewTransform = CGAffineTransformScale(self.imagePickerController.cameraViewTransform, -1, 1);
    } else {
        self.imagePickerController.cameraViewTransform = CGAffineTransformIdentity;
    }
}



@end
