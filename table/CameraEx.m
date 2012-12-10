//
//  CameraEx.m
//  table
//
//  Created by 礒井 友香 on 2012/12/06.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import "CameraEx.h"

@implementation CameraEx

// create imageView
-(void)viewDidLoad
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        return;
    }
    
    // create imagePicker
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    
    [self presentModalViewController:imagePicker animated:YES];
}

@end
