//
//  ViewController.h
//  JackNightsky-task8
//
//  Created by Jack on 15.07.21.
//

#import <UIKit/UIKit.h>

@protocol DrawingsProtocol <NSObject>
-(void)setDrawingPicture:(NSString*)picture;
@end


typedef NS_ENUM(NSInteger, ArtistVCStatement) {
    idle,
    draw,
    done
};


@interface ArtistViewController : UIViewController <DrawingsProtocol>
-(void)setCurrentState:(ArtistVCStatement)currentState;
@end

