//
//  rhOnboardingViewController.h
//  RunHero
//
//  Created by James Heller on 8/14/13.
//  Copyright (c) 2013 Run Hero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rhOnboardingViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeButtonHeightConstraint;

@property (strong, nonatomic) IBOutlet UIButton *getStartedButton;
- (IBAction)getStartedTouched:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *insetView;


- (IBAction)closeButtonTouched:(UIButton *)sender;
@end
