//
//  CanvasView.h
//  JackNightsky-task8
//
//  Created by Jack on 17.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

- (void)drawHead:(UIColor*)color1 :(UIColor*)color2 :(UIColor*)color3;
- (void)drawPlanet:(UIColor*)color1 :(UIColor*)color2 :(UIColor*)color3;
- (void)drawLandscape:(UIColor*)color1 :(UIColor*)color2 :(UIColor*)color3;
- (void)drawTree:(UIColor*)color0 :(UIColor*)color1 :(UIColor*)color2;
@end

NS_ASSUME_NONNULL_END
