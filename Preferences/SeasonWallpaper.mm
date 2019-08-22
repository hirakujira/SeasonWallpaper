#import <Preferences/Preferences.h>
@interface SeasonWallpaperListController: PSListController
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@implementation SeasonWallpaperListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SeasonWallpaper" target:self] retain];
	}
	return _specifiers;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{   
    switch (buttonIndex)
    {
        case 0:
            break;
        case 1:
        	sleep(1.5);
            system("killall lsd SpringBoard");
            break;
        default:
            break;
    }
}
-(void)saveSeason:(id)param {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Restart SpringBoard" message:@"You should restart SpringBoard to apply any changes. Do you want to restart SpringBoard now?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Respring", nil];
    [alert show];
    [alert release];
}
@end

// vim:ft=objc
