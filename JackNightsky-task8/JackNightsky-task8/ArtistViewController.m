//
//  ViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 15.07.21.
//

#import "ArtistViewController.h"
#import "CanvasView.h"
#import "AppRegularButton.h"
#import "UIColor+Palette.h"
#import "UserPaletteViewController.h"
#import "JackNightsky_task8-Swift.h"
#import "PlistWorker.h"


@interface ArtistViewController ()

@property (nonatomic) ArtistVCStatement currentState;
@property (nonatomic, nonnull) NSString *curentPicture;

@property (strong, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutlet AppRegularButton *openPaletteButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *openTimerButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *drawButton;
@property (strong, nonatomic) IBOutlet AppRegularButton *shareButton;

@property (nonatomic) NSTimer * timer;
@property (nonatomic) NSTimer * timer2;

@end // interface ArtistViewController ()


@implementation ArtistViewController 

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
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Set appearance view controller
    self.view.backgroundColor = UIColor.rsWhite;
    [self setCurrentState:idle];
    
    self.curentPicture = @"head";
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DrawingsViewController * drawings = segue.destinationViewController;
    drawings.delegate = self;
}


-(void)setDrawingPicture:(NSString *)picture {
    self.curentPicture = picture;
}


- (IBAction)openPalette:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * userPaletteViewController = [storyboard instantiateViewControllerWithIdentifier:@"UserPaletteVC"];
    
    [self presentViewController:userPaletteViewController animated:YES completion:nil];
}


- (IBAction)openTimer:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * timerViewController = [storyboard instantiateViewControllerWithIdentifier:@"TimerVC"];
    
    [self presentViewController:timerViewController animated:YES completion:nil];
}


- (IBAction)draw:(AppRegularButton*)sender {
    
    [self.canvas setCurrentPicture:self.curentPicture];
    
    if ([_drawButton.currentTitle isEqualToString: @"Draw"] && _currentState == idle) {
        [_canvas reset];
        [self setCurrentState:draw];
        [self stopTimer];
        
        float timeInterval = 1.0/60.0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                         target:self.canvas
                                                selector:@selector(changeStrokeEnd)
                                       userInfo:nil
                                        repeats:YES];
        
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
        
        _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.03
                                         target:self
                                       selector:@selector(checkProgressReverse)
                                       userInfo:nil
                                        repeats:YES];
    }
}


-(void)checkProgress {
    if (self.canvas.progress == 1) {
        [self setCurrentState:done];
        [self stopTimer];
        [self stopTimer2];
    }
}


-(void)checkProgressReverse {
    if (self.canvas.progress == 0) {
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


@end // implementation ArtistViewController
