//
//  CameraEx.m
//  table
//
//  Created by 礒井 友香 on 2012/12/06.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import "CameraEx.h"

@implementation CameraEx

//イメージビュー生成
//- (void)actionSheet:(UIActionSheet*)actionSheet
//clickedButtonAtIndex:(NSInteger)buttonIndex
-(void)viewDidLoad
{
    
    // ソースタイプを決定する
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    NSLog(@"check!");
    
    // 使用可能かどうかチェックする
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        return;
    }
    
    // イメージピッカーを作る
    UIImagePickerController*    imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    
    // イメージピッカーを表示する
    [self presentModalViewController:imagePicker animated:YES];
}

@end
