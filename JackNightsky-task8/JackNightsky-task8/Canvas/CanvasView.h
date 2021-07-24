//
//  CanvasView.h
//  JackNightsky-task8
//
//  Created by Jack on 17.07.21.
//

#import <UIKit/UIKit.h>
#import "ArtistViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView
@property (nonatomic) float progress;
- (void)setCurrentPicture:(NSString*)currentPicture;
- (void)drawMoterFucker:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2;
- (void)resetProgress:(float)progress;
- (void)reverseStrokeStart;
- (void)changeStrokeEnd;
- (void)reset;
- (void)drawHead:(UIColor*)color1 :(UIColor*)color2 :(UIColor*)color3;
- (void)drawPlanet:(UIColor*)color1 :(UIColor*)color2 :(UIColor*)color3;
- (void)drawLandscape:(UIColor*)color1 :(UIColor*)color2 :(UIColor*)color3;
- (void)drawTree:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2;
@end

NS_ASSUME_NONNULL_END
