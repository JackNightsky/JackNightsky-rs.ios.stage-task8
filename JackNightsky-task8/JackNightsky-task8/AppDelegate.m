//
//  AppDelegate.m
//  JackNightsky-task8
//
//  Created by Jack on 15.07.21.
//

#import "AppDelegate.h"
#import "ArtistViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ArtistViewController *rootViewController = storyboard.instantiateInitialViewController;

    [window setRootViewController:rootViewController];

    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
