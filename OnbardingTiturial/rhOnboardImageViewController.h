//
//  rhOnboardImageViewController.h
//  RunHero
//
//  Created by James Heller on 8/14/13.
//  Copyright (c) 2013 Run Hero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rhOnboardImageViewController : UIViewController

- (id)initWithImage:(UIImage *)image;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImageView *imageView;

@property (nonatomic) int index;

@end
