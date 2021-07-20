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
#import "UserPaletteViewController.h"
#import "PlistWorker.h"

typedef NS_ENUM(NSInteger, ArtistVCStatement) {
    idle,
    draw,
    done
};

@interface ArtistViewController ()
@property (strong, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutlet AppRegularButton *openPaletteButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *openTimerButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *drawButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *shareButton;

@property (nonatomic) ArtistVCStatement currentState;
-(void)setCurrentState:(ArtistVCStatement)currentState;
@property (nonatomic) NSTimer * timer;
@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.rsWhite;
    // Do any additional setup after loading the view.
    [self setCurrentState:idle];
}



- (void)setCurrentState:(ArtistVCStatement)currentState {
    switch (currentState) {
        case idle:
            _currentState = idle;
            
            [_drawButton setTitle:@"Draw" forState:UIControlStateNormal];
            
            [_canvas reset];
            [_openPaletteButton setEnabled:YES];
            [_openTimerButton setEnabled:YES];
            [_drawButton setEnabled:YES];
            [_shareButton setEnabled:NO];
            
            break;
            
        case draw:
            _currentState = draw;
            [_openPaletteButton setEnabled:NO];
            [_openTimerButton setEnabled:NO];
            [_drawButton setEnabled:NO];
            [_shareButton setEnabled:NO];
            
            
            break;
        case done:
            _currentState = done;
            
            [_drawButton setTitle:@"Reset" forState:UIControlStateNormal];
            
            [_openPaletteButton setEnabled:NO];
            [_openTimerButton   setEnabled:NO];
            [_drawButton        setEnabled:YES];
            [_shareButton       setEnabled:YES];
            
            
            break;
        default:
            break;
    }
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
    
    float drawDuration = [PlistWorker readValueForKey:@"drawDuration"].floatValue / 100;
    
    if (_currentState == idle) {
        NSLog(@"_currentState == idle");
        [self setCurrentState:draw];
        
        
        
        float timeInterval = 1.0/60.0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                         target:self.canvas
                                       selector:@selector(changeStrokeEnd)
                                       userInfo:nil
                                        repeats:YES];
        
        [NSTimer scheduledTimerWithTimeInterval:drawDuration
                                         target:self
                                       selector:@selector(stopTimer)
                                       userInfo:nil
                                        repeats:NO];
        
//        float current_time = _timer.timeInterval;
//        float start_time = _timer.timeInterval;
        [self setCurrentState:done];
        
    } else if (_currentState == draw) {
        NSLog(@"_currentState == draw");
        [self setCurrentState:done];
        [self stopTimer];
    } else if (_currentState == done) {
        NSLog(@"_currentState == done");
        [self setCurrentState:idle];
        [self stopTimer];
    } else {
        NSLog(@"_currentState is nil");
    }
    
}

-(void)stopTimer {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}






@end
