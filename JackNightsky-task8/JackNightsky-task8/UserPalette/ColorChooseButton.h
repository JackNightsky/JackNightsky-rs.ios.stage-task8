//
//  ColorChooseButton.h
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorChooseButton : UIButton
@property (nonatomic) BOOL choosed;
-(void)buttonTapOn;
-(void)buttonTapOff;
@end

NS_ASSUME_NONNULL_END
