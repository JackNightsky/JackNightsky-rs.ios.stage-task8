//
//  UserPaletteViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "UserPaletteViewController.h"
#import "UserPaletteView.h"
#import "ColorChooseButton.h"
#import "ColorPalette.h"

@interface UserPaletteViewController ()
@property (strong, nonatomic) IBOutlet UserPaletteView *paletteView;

@end

@implementation UserPaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
}

- (void)setDefaultBackgroundColor {
    [UIView animateWithDuration:0.1 animations:^{
        self.paletteView.backgroundColor = UIColor.rsWhite;
    }];
}


- (IBAction)colorChooseBtnTap:(ColorChooseButton*)sender {
    // TODO: - choose color and change view bacckground after choose
    
    [UIView animateWithDuration:0.3 animations:^{
        self.paletteView.backgroundColor = sender.backgroundColor;
    }];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(setDefaultBackgroundColor)
                                   userInfo:nil
                                    repeats:NO];
}


- (IBAction)saveChoicesAndClosePalette:(id)sender {
//    TODO: create results and send to AtristVC
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
