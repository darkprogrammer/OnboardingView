//
//  rhOnboardingViewController.m
//  RunHero
//
//  Created by James Heller on 8/14/13.
//  Copyright (c) 2013 Run Hero. All rights reserved.
//

#import "rhOnboardingViewController.h"

#import "rhOnboardImageViewController.h"

#import <QuartzCore/QuartzCore.h>

//static const int PAGE_WIDTH = 292;
//static const int PAGE_HEIGHT = 445;

@interface rhOnboardingViewController ()

@end

@implementation rhOnboardingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return 4;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self addChildViewController:_pageViewController];
    [self.insetView addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    _pageViewController.view.backgroundColor = [UIColor clearColor];
    CGRect frame = self.insetView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
     _pageViewController.view.frame = frame;
  
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    [self createPages];
    
    [_pageViewController setViewControllers:[NSArray arrayWithObject:[_viewControllers objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.view.gestureRecognizers = _pageViewController.view.gestureRecognizers;
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.75];
    
//    self.closeButton.titleLabel.font = [UIFont fontWithName:@"rh-icons-extended" size:12];
    [self.closeButton setTitle:@"X" forState:UIControlStateNormal];
    
    self.closeButton.layer.cornerRadius = _closeButtonHeightConstraint.constant / 2;
    self.closeButton.clipsToBounds = YES;
 
    
    [self.view bringSubviewToFront:_getStartedButton];
    [self.view bringSubviewToFront:self.closeButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createPages{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
//    CGRect frame = CGRectMake(0, 0, PAGE_WIDTH, PAGE_HEIGHT);
    
    rhOnboardImageViewController *onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"01.jpg"]];
    onboardingImage.index = 0;
    [viewControllers addObject:onboardingImage];
    
    onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"02.jpg"]];
    onboardingImage.index = 1;
    [viewControllers addObject:onboardingImage];
    
    onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"03.jpg"]];
    onboardingImage.index = 2;
    [viewControllers addObject:onboardingImage];
    
    onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"04.jpg"]];
    onboardingImage.index = 3;
    [viewControllers addObject:onboardingImage];
    
   /* onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"05.jpg"]];
    onboardingImage.index = 4;
    [viewControllers addObject:onboardingImage];
    
    onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"06.jpg"]];
    onboardingImage.index = 5;
    [viewControllers addObject:onboardingImage];
    
    onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"07.jpg"]];
    onboardingImage.index = 6;
    [viewControllers addObject:onboardingImage];
    
    onboardingImage = [[rhOnboardImageViewController alloc] initWithImage:[UIImage imageNamed:@"08.jpg"]];
    onboardingImage.index = 7;
    [viewControllers addObject:onboardingImage];
    */
    _viewControllers = [viewControllers copy];
}

#pragma mark - page control data source
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    int index = [(rhOnboardImageViewController *)viewController index];
    
    if(index == 0){
        return nil;
    }
    
//    if(index != [_viewControllers count] - 1){
//        _getStartedButton.hidden = NO;
//    }
    
    index--;
    
    return [_viewControllers objectAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    int index = [(rhOnboardImageViewController *)viewController index];
    
    index++;
    
    if(index == [_viewControllers count]){
        return nil;
    }
    
//    if(index == [_viewControllers count] - 1){
//        _getStartedButton.hidden = NO;
//    }
    
    rhOnboardImageViewController * onboardingViewController = [_viewControllers objectAtIndex:index];
    
    return onboardingViewController;
}

//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
//    return [_viewControllers count];
//}
//
//-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
//    return 0;
//}

#pragma mark page control delegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    if([[pendingViewControllers objectAtIndex:0] isEqual: [_viewControllers objectAtIndex:[_viewControllers count] - 1]]){
        _getStartedButton.hidden = NO;
    }
    else{
        _getStartedButton.hidden = YES;
    }
}

//- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
//}

//- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation{
//    
//}

- (IBAction)closeButtonTouched:(UIButton *)sender {
    [self getStartedPressed];
    
}

-(void)getStartedPressed{
    CGRect frame = self.view.bounds;
    CGRect newFrame = self.view.bounds;
    newFrame.origin.y = newFrame.size.height;
    
    self.view.frame = frame;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = newFrame;
    } completion:^(BOOL finished){
        [self.view removeFromSuperview];
     //   self.view = NULL;
    }];
}

- (IBAction)getStartedTouched:(UIButton *)sender {
    [self getStartedPressed];
}
@end
