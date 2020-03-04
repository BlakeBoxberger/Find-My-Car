@interface OverridenBackgroundColorButton: UIButton
@property (nonatomic, copy, readwrite) UIColor *overridingBackgroundColor;
@end

@interface MKDistanceFormatter: NSFormatter
- (NSString *) stringFromObjectValue:(id)object;
- (NSString *) stringFromDistance:(CGFloat)distance;
@end

@interface MKMapItem: NSObject
@end

@interface CLLocationManager (Private)
+ (CLLocationManager *)sharedManager;
@end

@interface ParkedCar: NSObject
@property (nonatomic, retain) NSDate *date;
@property (nonatomic) CGFloat horizontalAccuracy;
@property (nonatomic, retain) NSString *locationDisplayString;
@property (nonatomic, retain) NSString *title;
@property (nonatomic) NSUInteger locationQuality;
@property (nonatomic, retain) MKMapItem *mapItem;
@property (nonatomic, assign, readwrite) CLLocationCoordinate2D coordinate;
@end

@interface ParkedCarViewController: UIViewController
@property (nonatomic, strong, readwrite) ParkedCar *parkedCar;
@end