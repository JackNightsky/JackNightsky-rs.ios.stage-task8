//
//  UserPaletteViewController.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "UserPaletteViewController.h"

@interface UserPaletteViewController ()

@end

@implementation UserPaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
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
