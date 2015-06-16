# OnboardingView

Usage
Copy  from Main.storyboard controller rhOnboardingViewController and paste in youth storyboard  Outlets и Actions must be not broken, if no reestablish them.
In required controller add after #import :
@class rhOnboardingViewController;
Add property:
@property (strong, nonatomic) rhOnboardingViewController *onboardingViewController;
 in ViewDidLoad: 
 if([[defs valueForKey:@"firstRun"] isEqualToString:@"firstRun"]){
    _onboardingViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"rhOnboardingViewController"];
    
    [self.view addSubview:_onboardingViewController.view];
    
    CGRect frame = self.view.bounds;
    
    _onboardingViewController.view.frame = CGRectMake(frame.origin.x, frame.size.height, frame.size.width, frame.size.height);
    
    [UIView animateWithDuration:0.5 animations:^{
        _onboardingViewController.view.frame = frame;
    }];
        [defs setValue:@"firstRun" forKey:@"firstRun"];
        [defs synchronize];
        
    }
