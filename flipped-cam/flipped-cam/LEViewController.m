//
//  LEViewController.m
//  flipped-cam
//
//  Created by Lucas Eduardo  Chaves Frota on 14/07/13.
//  Copyright (c) 2013 Lucas Eduardo Chaves Frota. All rights reserved.
//

#import "LEViewController.h"
#import "LEImagePickerController.h"


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
    self.imagePicker = [[LEImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    else
    {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];

}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *newImage = [info objectForKey:UIImagePickerControllerOriginalImage];

    self.imageView.image = newImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
