//
//  rhOnboardImageViewController.m
//  RunHero
//
//  Created by James Heller on 8/14/13.
//  Copyright (c) 2013 Run Hero. All rights reserved.
//

#import "rhOnboardImageViewController.h"

@interface rhOnboardImageViewController ()

@end

@implementation rhOnboardImageViewController

- (id)initWithImage:(UIImage *)image{
    self = [super init];
    if(self){
        _image = image;
        
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.backgroundColor = [UIColor clearColor];
        
        self.view.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_imageView];
        self.view = _imageView;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    CGRect frame = self.parentViewController.view.frame;
//    frame.size.width = frame.size.width * .8;
//    frame.size.height = frame.size.height * .8;
//    
//    self.view.frame = frame;
//    self.imageView.frame = frame;
    
//    CGRect frame = _imageView.frame;
//    frame = self.view.frame;
    
//    _imageView.center = self.view.center;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
