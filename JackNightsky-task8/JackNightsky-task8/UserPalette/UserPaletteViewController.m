//
//  UserPaletteViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "UserPaletteViewController.h"
#import "UserPaletteView.h"
#import "ColorChooseButton.h"
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
@property (strong, nonatomic) IBOutlet UserPaletteView *paletteView;
@property (nonatomic) int colorsCount;
@property (nonatomic) NSMutableArray * colorsArray;
@end

@implementation UserPaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _colorsArray = @[].mutableCopy;
    _colorsCount = 0;
}

- (void)setDefaultBackgroundColor {
    [UIView animateWithDuration:0.1 animations:^{
        self.paletteView.backgroundColor = UIColor.rsWhite;
    }];
}


- (IBAction)colorChooseBtnTap:(ColorChooseButton*)sender {
    // TODO: - choose color and change view bacckground after choose
    NSArray * colorsFromTag = @[
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
   
    if (!sender.choosed && _colorsCount < 3) {
        _colorsCount++;
        [sender buttonTapOn];
        sender.choosed = YES;
        [UIView animateWithDuration:0.3 animations:^{
            self.paletteView.backgroundColor = sender.backgroundColor;
        }];
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(setDefaultBackgroundColor)
                                       userInfo:nil
                                        repeats:NO];

        [_colorsArray addObject: [colorsFromTag objectAtIndex:sender.tag]];
        
    } else if (!sender.choosed && _colorsCount == 3) {
        
    } else {
        if (_colorsCount > 0) {_colorsCount-- ;}
        [sender buttonTapOff];
        NSLog(@"btn unchoose");
        sender.choosed = NO;
        [_colorsArray removeObject:[colorsFromTag objectAtIndex:sender.tag]];
        NSLog(@"_colorsArray: %@ ", _colorsArray);
    }
    
}


- (IBAction)saveChoicesAndClosePalette:(id)sender {
//    TODO: create results and send to AtristVC
    while (_colorsArray.count < 3) {
        [_colorsArray addObject:@"rsBlack"];
    }
    
    
    [_colorsArray shuffle];
    NSLog(@"_colorsArray shuffled: %@", _colorsArray);
    [PlistWorker writeValueForKey:@"pathColors" withValue:_colorsArray];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



