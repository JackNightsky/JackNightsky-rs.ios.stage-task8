//
//  ViewController.h
//  JackNightsky-task8
//
//  Created by Jack on 15.07.21.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ArtistVCStatement) {
    idle,
    draw,
    done
};


@interface ArtistViewController : UIViewController

-(void)setCurrentState:(ArtistVCStatement)currentState;
@end

