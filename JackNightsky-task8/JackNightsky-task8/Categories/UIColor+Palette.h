//
//  ColorPalette.h
//  JackNightsky-task8
//
//  Created by Jack on 16.07.21.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Palette)

// App interface palette
@property(class, nonatomic, readonly) UIColor *rsBlack;
@property(class, nonatomic, readonly) UIColor *rsChillSky;
@property(class, nonatomic, readonly) UIColor *rsLightGreenSea;
@property(class, nonatomic, readonly) UIColor *rsWhite;

// User palette
@property(class, nonatomic, readonly) UIColor *rsRed;
@property(class, nonatomic, readonly) UIColor *rsBlue;
@property(class, nonatomic, readonly) UIColor *rsGreen;
@property(class, nonatomic, readonly) UIColor *rsGrey;
@property(class, nonatomic, readonly) UIColor *rsLightPurple;
@property(class, nonatomic, readonly) UIColor *rsShrimple;
@property(class, nonatomic, readonly) UIColor *rsYellow;
@property(class, nonatomic, readonly) UIColor *rsCyan;
@property(class, nonatomic, readonly) UIColor *rsPink;
@property(class, nonatomic, readonly) UIColor *rsDirtBlue;
@property(class, nonatomic, readonly) UIColor *rsDirtGreen;
@property(class, nonatomic, readonly) UIColor *rsBrown;

@end // color set interface


NS_ASSUME_NONNULL_END
