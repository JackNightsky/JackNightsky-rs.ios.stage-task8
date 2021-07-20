//
//  ViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 15.07.21.
//

#import "ArtistViewController.h"
#import "ColorPalette.h"
#import "CanvasView.h"
#import "AppRegularButton.h"

@interface ArtistViewController ()
@property (strong, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutlet AppRegularButton *openPaletteButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *openTimerButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *drawButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *shareButton;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.rsWhite;
    // Do any additional setup after loading the view.
    NSLog(@"drawPlanet");
    
}



- (IBAction)openPalette:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * userPaletteViewController = [storyboard instantiateViewControllerWithIdentifier:@"UserPaletteVC"];
    
//    userPaletteViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:userPaletteViewController animated:YES completion:nil];
    NSLog(@"UserPalette isBeingPresented%d", userPaletteViewController.isBeingPresented);
    
}

- (IBAction)openTimer:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * timerViewController = [storyboard instantiateViewControllerWithIdentifier:@"TimerVC"];
    
//    userPaletteViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:timerViewController animated:YES completion:nil];
    NSLog(@"Timer isBeingPresented%d", timerViewController.isBeingPresented);
    
    
}

- (IBAction)draw:(id)sender {
    [_canvas drawHead   :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
    [_canvas drawPlanet :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
    [_canvas drawLandscape :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
    [_canvas drawTree :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
}


@end
