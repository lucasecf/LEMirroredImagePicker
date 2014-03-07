LEImagePickerController
===========

## What is this

When using the `UIImagePickerController`, some of you must notice that the photo that the front camera takes is mirrored.

And even if you just invert the image taken in the delegate, the image displayed as preview one in the UIImagePickerController
is still mirrored, resulting in a bad experience by the user, who expects the camera works just as the camera APP.

See the example of `UIImagePickerController`'s front camera photo below:

![My image](http://img27.imageshack.us/img27/5982/y1pe.png)  ------ ![My image](http://imageshack.us/a/img836/2940/mehu.png)

Image that appears in the c amera  ------------   Mirrored image that appears in the preview image


When using the `LEImagePickerController`, the front camera photo works just fine, the preview image will be the same image displayed in the screen, as expected.


## How to Use

To use the `LEImagePickerController`, just download the project and drag or copy the two files `LEImagePickerController.h` and `LEImagePickerController.m` to 
your project, and use as you would use the `UIImagePickerController` normally.

It even responds to the same delegate. See the example below, in some `UIViewController`

```  objective-c

//some button action that invokes the camera
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



##Collaborate
Liked the project? Is there something missing or that could be better? Feel free to contribute :)

1. Fork it

2. Create your branch
   ``` git checkout -b name-your-feature ```

3. Commit it
   ``` git commit -m 'the differece' ```

4. Push it
   ``` git push origin name-your-feature ```

5. Create a Pull Request

##License
This projected is licensed under the terms of the MIT license.
