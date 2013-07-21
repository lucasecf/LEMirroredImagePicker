//
//  LEViewController.h
//  flipped-cam
//
//  Created by Lucas Eduardo  Chaves Frota on 14/07/13.
//  Copyright (c) 2013 Lucas Eduardo Chaves Frota. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LEImagePickerController;

@interface LEViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) LEImagePickerController *imagePicker;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)cameraButtonDidTouch:(id)sender;
@end
