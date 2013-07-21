LEImagePickerController
===========

## What is this

This project has the goal to make a framework to the camera phone in iOS.

When using the UIImagePickerController, some of you must notice that the photo that the front camera takes is mirrored.

And even if you just invert the image taken in the delegate, the image displayed as preview one in the UIImagePickerController
is still mirrored, resulting in a bad experience by the user, who expects the camera works just as the camera APP.

See the example of UIImagePickerController's front camera photo below:

![My image](https://photos-6.dropbox.com/t/0/AABnOVCboaeZBowyRUqxer4hSn2MZm6k3j4vTTikg9_9_A/12/32381796/png/32x32/3/_/1/2/foto%20%281%29.PNG/E4RfcrDqISSm6dQuUk1zefPeBFXlg7RDBp_awOq9e4Y?size=1280x960)  ------ ![My image](https://photos-5.dropbox.com/t/0/AACGsGcqDYKXUI8v0YimBJ7cyb41kAmMffgpH7Oj_WgZ_w/12/32381796/png/32x32/3/_/1/2/foto.PNG/AkTkRREfrfJcgsywVKNZRLVjT9SsMwJ-EK_4s-8EMwg?size=1280x960)

Image that appears in the c amera  ------------   Mirrored image that appears in the preview image


When using the LEImagePickerController, the front camera photo works just fine, the preview image will be the same image displayed in the screen, as expected.


## How to Use

To use the LEImagePickerController, just download the project and drag or copy the two files (LEImagePickerController.h and LEImagePickerController.m) to 
your project, and use as you would use the UIImagePickerController normally.

It even responds to the same delegate. See the example below, in some UIViewController

```  objective-c
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
```
