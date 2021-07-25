//
//  AppRegularButton.h
//  JackNightsky-task8
//
//  Created by Jack on 17.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CurrentStatement) {
    ready,
    active
};

@interface AppRegularButton : UIButton
@property (nonatomic, readonly) CurrentStatement currentState;
-(void)setCurrentState:(CurrentStatement)currentState;
@end

NS_ASSUME_NONNULL_END
