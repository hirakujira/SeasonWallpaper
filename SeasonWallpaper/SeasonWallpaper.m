#import "SeasonWallpaper.h"

#define iPad UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define iPhone6  [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 667.0
#define iPhone6P  [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 736.0

@interface SeasonWallpaper ()
@end

@interface UIImage(CPBitmap)
+(id)imageWithContentsOfCPBitmapFile:(id)arg1 flags:(int)arg2;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (id)newImageRotatedByDegrees:(float)arg1 ;
@end

@implementation SeasonWallpaper

#pragma mark - Wallpaper information

@synthesize delegate = _delegate;

+ (NSString *)identifier
{
    return @"SeasonWallpaper";
}

+ (BOOL)colorChangesSignificantly
{
    return YES;
}

+ (NSString *)thumbnailImageName {
//    if ([options[@"LS"] boolValue])
//        return @"LockscreenThumbnail";
//    else
        return @"HomescreenThumbnail";
}

+ (NSString *)representativeThumbnailImageName {
    return @"LockscreenThumbnail";
}

+ (NSArray *)presetWallpaperOptions
{
    return @[
            @{ @"kSBUIMagicWallpaperThumbnailNameKey": @"LockscreenThumbnail",@"LS": @(YES) },
            @{ @"kSBUIMagicWallpaperThumbnailNameKey": @"HomescreenThumbnail",@"LS": @(NO) }
            ];
}

- (void)setWallpaperOptions:(NSDictionary *)options
{
//    if ([options[@"kSBUIMagicWallpaperThumbnailNameKey"] isEqualToString:@"LockscreenThumbnail"]) {
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfCPBitmapFile:@"/var/mobile/Library/SpringBoard/LockBackground.cpbitmap" flags:0]];
//    }
//    else if (options != nil)
//    {
//        if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/SpringBoard/HomeBackground.cpbitmap"]) {
//            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfCPBitmapFile:@"/var/mobile/Library/SpringBoard/HomeBackground.cpbitmap" flags:0]];
//        }
//        else {
//            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfCPBitmapFile:@"/var/mobile/Library/SpringBoard/LockBackground.cpbitmap" flags:0]];
//        }
//    }
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:@"/var/mobile/Library/SpringBoard/LockBackgroundThumbnail.jpg"]];
}

- (void)setWallpaperVariant:(int)variant {
}

- (UIView *)view {
    return self;
}


#pragma mark - Wallpaper implementation

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame]))
        return nil;
    countLock = 0;
    plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/tw.hiraku.seasonwallpaper.plist"];
   
    type = [[plistDict objectForKey:@"type"] intValue];
	alpha = [[plistDict objectForKey:@"alpha"] floatValue]/100;
    max = [[plistDict objectForKey:@"max"] integerValue];
    frequency = [[plistDict objectForKey:@"frequency"] floatValue];

    if (max < 1)
        max = 20;
    if (frequency < 0.1 || frequency > 10)
        frequency = 2;
    
    return self;
}

- (void)onTimer
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    int chooseImage = round(random() % 5);
    
    if (type == 1) {
        switch (chooseImage) {
            case 0:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"flower1" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];;
                break;
            case 1:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"flower2" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];;
                break;
            case 2:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"flower3" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];;
                break;
            case 3:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"flower4" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];;
                break;
            case 4:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"flower5" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];;
                break;
            default:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"flower1" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];;
                break;
        }
    }
    else if(type == 2)
    {
        switch (chooseImage) {
            case 0:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"leaf1" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 1:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"leaf2" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 2:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"leaf3" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 3:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"leaf4" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 4:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"leaf5" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            default:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"leaf1" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
        }
    }
    else if(type == 3)
    {
        switch (chooseImage) {
            case 0:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"feather1" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 1:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"feather2" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 2:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"feather3" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 3:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"feather4" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            case 4:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"feather5" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
            default:
                flakeImage = [[UIImage imageWithContentsOfFile:[bundle pathForResource:@"feather1" ofType:@"png"]] newImageRotatedByDegrees:(rand()%360)];
                break;
        }
    }
    else
    {
        flakeImage = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"flake" ofType:@"png"]];
    }
    
	// build a view from our flake image
    if ([self.subviews count] < max)
    {
        UIImageView* flakeView = [[UIImageView alloc] initWithImage:flakeImage];
        int widthP = 320;
        int widthL = 480;
        int startX = 0;
        int endX = 0;
        int height = 570;
        // use the random() function to randomize up our flake attributes
        if (iPad) {
            widthP = 768;
            widthL = 1024;
            height = 1035;
        }
        else {
            if (iPhone6P) {
                widthP = 414;
                widthL = 740;
                height = 750;
            }
            else if (iPhone6) {
                widthP = 350;
                widthL = 670;
                height = 680;
            }
//            startX = round(random() % widthP);
//            endX = round(random() % widthP);
        }
        if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
            startX = round(random() % widthP);
            endX = round(random() % widthP);
        }
        else if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
            startX = round(random() % widthL);
            endX = round(random() % widthL);
        }
//        NSLog(@"%d %@",widthP,self);
        
        double scale = 1 / round(random() % 100) + 1.0;
        double speed = 1 / round(random() % 100) + 1.0;
        double delay = arc4random()%3;
        
        // set the flake start position
        switch (type) {
            case 0:
                flakeView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
                break;
            case 1:
                flakeView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
                break;
            case 2:
                flakeView.frame = CGRectMake(startX, -100.0, 50.0 * scale, 50.0 * scale);
                break;
            case 3:
                flakeView.frame = CGRectMake(startX, -100.0, 50.0 * scale, 50.0 * scale);
                break;
            default:
                flakeView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
                break;
        }
        
        if (alpha < 0.01)
            flakeView.alpha = 0.35;
        else
            flakeView.alpha = alpha;
        
        [self addSubview:flakeView];
        
        // set up how fast the flake will fall
        if (type == 0) {
            [UIView animateWithDuration:5 * speed delay:delay options: UIViewAnimationOptionCurveEaseInOut animations:^{ flakeView.frame = CGRectMake(endX, height, 25.0 * scale, 25.0 * scale);} completion:^(BOOL finished){ [flakeView removeFromSuperview]; }];
        }
        else if (type == 1)
        {
            [UIView animateWithDuration:10 * speed delay:0.0 options: UIViewAnimationOptionCurveEaseInOut animations:^{ flakeView.frame = CGRectMake(endX, height, 25.0 * scale, 25.0 * scale);} completion:^(BOOL finished){ [flakeView removeFromSuperview]; }];
        }
        else if (type == 2 || type == 3)
        {
            [UIView animateWithDuration:10 * speed delay:0.0 options: UIViewAnimationOptionCurveLinear animations:^{ flakeView.frame = CGRectMake(endX, 570, 50.0 * scale, 50.0 * scale);} completion:^(BOOL finished){ [flakeView removeFromSuperview]; }];
        }
        // set a stop callback so we can cleanup the flake when it reaches the
        // end of its animation
    }
    //NSLog(@"count %lu , subviews %f ",(unsigned long)[self.subviews count],[(UIImageView *)[self.subviews objectAtIndex:0]  frame].origin.x);
}

- (void)setAnimating:(BOOL)animating
{
//    if (!countLock) {
//        if (animating) {
//            countLock =YES;
//            if (type == 0) {
//                self.animatedTimer = [NSTimer scheduledTimerWithTimeInterval:(1/frequency) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
//            }
//            else
//            {
//                self.animatedTimer = [NSTimer scheduledTimerWithTimeInterval:(1/frequency) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
//            }
//            if ([[self subviews] count] > 0) {
//                [[[self subviews] firstObject] removeFromSuperview];
//               // NSLog(@"count %lu , subviews %f ",(unsigned long)[self.subviews count],[(UIImageView *)[self.subviews objectAtIndex:0]  frame].origin.x);
//            }
//            [self resumeLayer:self.layer];
//        }
//    }
//    else
//    {
//        if (!animating)
//        {
//            countLock =  NO;
//            //self.cleanTimer = [NSTimer scheduledTimerWithTimeInterval:(10) target:self selector:@selector(clean) userInfo:nil repeats:YES];
//            [self pauseLayer:self.layer];
//            [self.animatedTimer invalidate];
//            self.animatedTimer = nil;
//        }
//    }
}

-(void)clean
{
    if ([[self subviews] count] > 0) {
        [[[self subviews] firstObject] removeFromSuperview];
    }
    //NSLog(@"the counter is %lu",(unsigned long)[[self subviews] count]);
    
}

-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval paused_time = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = paused_time;
}

-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval paused_time = [layer timeOffset];
    layer.speed = 1.0f;
    layer.timeOffset = 0.0f;
    layer.beginTime = 0.0f;
    CFTimeInterval time_since_pause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - paused_time;
    layer.beginTime = time_since_pause;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
