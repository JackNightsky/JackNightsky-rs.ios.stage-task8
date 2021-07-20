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


@interface ArtistViewController ()
@property (strong, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutlet AppRegularButton *openPaletteButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *openTimerButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *drawButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *shareButton;

@property (nonatomic) ArtistVCStatement currentState;

@property (nonatomic) NSTimer * timer;
@property (nonatomic) NSTimer * timer2;
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


- (IBAction)draw:(AppRegularButton*)sender {
    NSLog(@"_drawButton.currentTitle %@", _drawButton.currentTitle);
    NSLog(@"_currentState == idle %d", _currentState == idle);
    NSLog(@"_currentState == draw %d", _currentState == draw);
    NSLog(@"_currentState == done %d", _currentState == done);
    
    if ([_drawButton.currentTitle isEqualToString: @"Draw"] && _currentState == idle) {
        NSLog(@"_currentState == idle");
        [self setCurrentState:draw];
        [self stopTimer];
        
        float timeInterval = 1.0/60.0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                         target:self.canvas
                                                selector:@selector(changeStrokeEnd)
                                       userInfo:nil
                                        repeats:YES];
        
        NSLog(@"xxxx");
        _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1
                                         target:self
                                       selector:@selector(checkProgress)
                                       userInfo:nil
                                        repeats:YES];
        
    } else if ([_drawButton.currentTitle isEqualToString: @"Reset"] && _currentState == done) {
        [self setCurrentState:draw];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.03
                                                 target:self.canvas
                                               selector:@selector(reverseStrokeStart)
                                               userInfo:nil
                                                repeats:YES];
        
        NSLog(@"xxxx");
        _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.03
                                         target:self
                                       selector:@selector(checkProgressReverse)
                                       userInfo:nil
                                        repeats:YES];
    }
    
}


-(void)checkProgress {
    if (self.canvas.progress == 1) {
        NSLog(@"self.canvas.progress %f", self.canvas.progress);
        [self setCurrentState:done];
        [self stopTimer];
        [self stopTimer2];
    }
}

-(void)checkProgressReverse {
    if (self.canvas.progress == 0) {
        NSLog(@"self.canvas.progress %f", self.canvas.progress);
        [self setCurrentState:idle];
        [self stopTimer];
        [self stopTimer2];
    }
}


-(void)stopTimer {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}

-(void)stopTimer2 {
    if ([_timer2 isValid]) {
        [_timer2 invalidate];
    }
    _timer2 = nil;
}






@end
