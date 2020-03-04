#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Interfaces.h"

@interface FindMyParkedCarViewController: UIViewController <CLLocationManagerDelegate>
@property (nonatomic, retain) UIVisualEffectView *backgroundView;
@property (nonatomic, retain) UIImageView *arrowView;
@property (nonatomic, strong, readwrite) ParkedCar *parkedCar;
@property (nonatomic, retain) MKDistanceFormatter *distanceFormatter;
@property (nonatomic, retain) CLLocationManager *locationManager;
- (void)handleTap:(UIGestureRecognizer *)sender;
@end

@interface ParkedCarViewController (Private)
@property (nonatomic, retain) FindMyParkedCarViewController *findMyParkedCarViewController;
@end