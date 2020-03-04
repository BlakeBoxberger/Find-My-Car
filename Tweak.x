#import "FindMyParkedCarViewController.h"

%hook ParkedCarViewController
%property (nonatomic, retain) FindMyParkedCarViewController *findMyParkedCarViewController;

- (void)viewDidLoad {
    %orig;

    // self.definesPresentationContext = YES;

    // Create our new view controller
    self.findMyParkedCarViewController = [FindMyParkedCarViewController new];

    // Force our new view controller to load
    [self.findMyParkedCarViewController view];

    // Change "Directions" button to "Find My Car" button
    OverridenBackgroundColorButton *directionsButton = [self valueForKey: @"_directionsButton"];
    directionsButton.overridingBackgroundColor = UIColor.systemGrayColor;
    [directionsButton setTitle: @"Find My Car" forState: UIControlStateNormal];

    // Pass utility properties
    self.findMyParkedCarViewController.parkedCar = self.parkedCar;
    self.findMyParkedCarViewController.distanceFormatter = [self valueForKey: @"_distanceFormatter"];
}

- (void)_getDirections {
    [self presentViewController: self.findMyParkedCarViewController
                       animated: YES
                     completion: nil];
}

%end
