//
//  LEMirroredImagePicker.h
//  LEMirroredImagePicker
//
//  Created by Lucas Eduardo on 05/21/2015.
//  Copyright (c) 2014 Lucas Eduardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEMirroredImagePicker : NSObject

@property(nonatomic, weak) UIImagePickerController *imagePickerController;

- (id)initWithImagePicker:(UIImagePickerController*)pickerController;
- (void)mirrorFrontCamera;

@end
