#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SBFProceduralWallpaper.h"

@interface SeasonWallpaper : UIView <SBFProceduralWallpaper>
{
    UIImage* flakeImage;
    NSMutableDictionary* plistDict;
    float alpha;
    float frequency;
    long max;
    int type;
    bool lock;
    bool countLock;
    UIImageView *oldView;
    int oldX;
    bool loop;
    NSMutableArray* xArray;
    CGRect* oldFrame;
}
//@property (nonatomic, retain) UIImage* flakeImage;
@property (nonatomic, retain)NSTimer* animatedTimer;
@property (nonatomic, retain)NSTimer* cleanTimer;
- (void)onTimer;
- (void)clean;
- (void)pauseLayer:(CALayer*)layer;
- (void)resumeLayer:(CALayer*)layer;
@end
