//
//  ViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 15.07.21.
//

#import "ArtistViewController.h"
#import "ColorPalette.h"
#import "CanvasView.h"

@interface ArtistViewController ()
@property (strong, nonatomic) IBOutlet CanvasView *canvas;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.rsWhite;
    // Do any additional setup after loading the view.
    NSLog(@"drawPlanet");
    
}

- (IBAction)draw:(id)sender {
    [_canvas drawHead   :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
    [_canvas drawPlanet :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
    [_canvas drawLandscape :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
    [_canvas drawTree :UIColor.rsRed :UIColor.rsBlue :UIColor.rsCyan];
}


@end
