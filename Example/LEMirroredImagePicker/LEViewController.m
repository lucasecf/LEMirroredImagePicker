//
//  LEViewController.m
//  LEMirroredImagePicker
//
//  Created by Lucas Eduardo on 05/21/2015.
//  Copyright (c) 2014 Lucas Eduardo. All rights reserved.
//

#import "LEViewController.h"
#import <LEMirroredImagePicker/LEMirroredImagePicker.h>

@interface LEViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic) LEMirroredImagePicker *mirrorFrontPicker;
@property(nonatomic) UIImagePickerController *pickerController;

@end

@implementation LEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButtonDidTouch:(id)sender
{
    UIImagePickerController *pickerController = [UIImagePickerController new];
    pickerController.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    else
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    self.mirrorFrontPicker = [[LEMirroredImagePicker alloc] initWithImagePicker:pickerController];
    [self.mirrorFrontPicker mirrorFrontCamera];
    
    [self presentViewController:pickerController animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *newImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = newImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
