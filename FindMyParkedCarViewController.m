#import "FindMyParkedCarViewController.h"

@implementation FindMyParkedCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.modalPresentationStyle = UIModalPresentationOverFullScreen;

    // Set background color to clear
    self.view.backgroundColor = [UIColor clearColor];

    // Set up backgroundView
    if (@available(iOS 13, *)) {
        self.backgroundView = [[UIVisualEffectView alloc] initWithEffect: [UIBlurEffect effectWithStyle: 1100]]; // Same as ParkedCarView
    } else {
        self.backgroundView = [[UIVisualEffectView alloc] initWithEffect: [UIBlurEffect effectWithStyle: UIBlurEffectStyleRegular]];
    }

    [self.view addSubview: self.backgroundView];

    // Set up arrowView
    UIImage *arrowImage = [UIImage imageWithContentsOfFile: @"/Library/Application Support/FindMyCar/arrow@3x.png"];
    self.arrowView = [[UIImageView alloc] initWithImage: arrowImage];
    [self.view addSubview: self.arrowView];

    [self.arrowView.widthAnchor constraintEqualToConstant: 216.0].active = YES;
    [self.arrowView.heightAnchor constraintEqualToAnchor: self.arrowView.widthAnchor].active = YES;
    
    // Set up locationManager
    self.locationManager = [NSClassFromString(@"CLLocationManager") sharedManager];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;

    // Set up dismiss gesture
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[self.view addGestureRecognizer: tapGestureRecognizer];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.backgroundView.frame = self.view.bounds;
    self.arrowView.center = self.backgroundView.center;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self.locationManager startUpdatingHeading];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    [self.locationManager stopUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    float heading = newHeading.magneticHeading; 
    float headingDegrees = (heading * M_PI/180);
    self.arrowView.transform = CGAffineTransformMakeRotation(headingDegrees);
}

- (void)handleTap:(UIGestureRecognizer *)sender {
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end
