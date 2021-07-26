//
//  UserPaletteViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "UserPaletteViewController.h"
#import "UserPaletteView.h"
#import "ColorChooseButton.h"
#import "ColorChoose.h"
#import "UIColor+Palette.h"
#import "PlistWorker.h"



@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    NSUInteger count = [self count];
    if (count <= 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end


@interface UserPaletteViewController ()
@property (strong, nonatomic) IBOutlet UIStackView *paletteStackWithStack;
@property (strong, nonatomic) IBOutlet UserPaletteView *paletteView;
@property (nonatomic) int colorsCount;
@property (nonatomic, nonnull) NSMutableArray * colorsArray;
@property (nonatomic) NSArray * colorsFromTag;
@property (nonatomic) NSTimer * timer;
@end

@implementation UserPaletteViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _colorsArray = @[].mutableCopy;
    _colorsCount = 3;
    
    _colorsArray = [PlistWorker readValueForKey:@"pathColors"];
    self.colorsFromTag = @[
        @"rsRed",          // 0
        @"rsBlue",         // 1
        @"rsGreen",        // 2
        @"rsGrey",         // 3
        @"rsLightPurple",  // 4
        @"rsShrimple",     // 5
        @"rsYellow",       // 6
        @"rsCyan",         // 7
        @"rsPink",         // 8
        @"rsDirtBlue",     // 9
        @"rsDirtGreen",    // 10
        @"rsBrown"         // 11
    ];
    
    for (ColorChoose* container in [self.paletteStackWithStack.subviews.firstObject.subviews
                                    arrayByAddingObjectsFromArray: self.paletteStackWithStack.subviews.lastObject.subviews]) {
        ColorChooseButton * btn =  container.subviews.firstObject;
        
        if ([_colorsArray containsObject:[_colorsFromTag objectAtIndex:btn.tag]] ) {
            [btn buttonTapOn];
            btn.choosed = YES;
        }
    }
    
}

- (void)setDefaultBackgroundColor {
    [UIView animateWithDuration:0.1 animations:^{
        self.paletteView.backgroundColor = UIColor.rsWhite;
    }];
}


- (IBAction)colorChooseBtnTap:(ColorChooseButton*)sender {
    // TODO: - choose color and change view bacckground after choose
    
    if (!sender.choosed && _colorsCount < 3) {
        _colorsCount++;
        [sender buttonTapOn];
        sender.choosed = YES;
        [UIView animateWithDuration:0.2 animations:^{
            self.paletteView.backgroundColor = sender.backgroundColor;
        }];

        [_colorsArray addObject: [_colorsFromTag objectAtIndex:sender.tag]];
        
    } else if (!sender.choosed && _colorsCount == 3) {
        [sender buttonTapOn];
        sender.choosed = YES;
        [UIView animateWithDuration:0.2 animations:^{
            self.paletteView.backgroundColor = sender.backgroundColor;
        }];
        
        
        NSString * removedColor = [_colorsArray objectAtIndex:0];
        [_colorsArray removeObjectAtIndex:0];
        [_colorsArray addObject: [_colorsFromTag objectAtIndex:sender.tag]];
        for (ColorChoose* container in [self.paletteStackWithStack.subviews.firstObject.subviews arrayByAddingObjectsFromArray: self.paletteStackWithStack.subviews.lastObject.subviews]) {
            if (container.subviews.firstObject.tag == [_colorsFromTag indexOfObject:removedColor]) {
                ColorChooseButton * btn =  container.subviews.firstObject;
                btn.choosed = NO;
                [btn buttonTapOff];
            }
        }
        
    } else {
        if (_colorsCount > 0) {_colorsCount-- ;}
        [sender buttonTapOff];
        sender.choosed = NO;
        [_colorsArray removeObject:[_colorsFromTag objectAtIndex:sender.tag]];
    }
    [self.timer invalidate];
    self.timer =  nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(setDefaultBackgroundColor)
                                   userInfo:nil
                                    repeats:NO];
}


- (IBAction)saveChoicesAndClosePalette:(id)sender {
//    TODO: create results and send to AtristVC
    while (_colorsArray.count < 3) {
        [_colorsArray addObject:@"rsBlack"];
    }
    
    
    [_colorsArray shuffle];
    [PlistWorker writeValueForKey:@"pathColors" withValue:_colorsArray];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end



