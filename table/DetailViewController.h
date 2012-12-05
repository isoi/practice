//
//  DetailViewController.h
//  table
//
//  Created by 礒井 友香 on 2012/12/05.
//  Copyright (c) 2012年 礒井 友香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
