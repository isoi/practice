//
//  CameraViewController.h
//  table
//
//  Created by 礒井 友香 on 2012/12/06.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImageView* _imageView;
}

@end