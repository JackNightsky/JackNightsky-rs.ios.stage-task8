//
//  PlistWorker.h
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlistWorker : NSObject

+(NSString*)readValueForKey:(NSString*)key;
+(void)writeValueForKey:(NSString*)key withValue:(id)value;

@end

NS_ASSUME_NONNULL_END


/*
 MARK: - pictureSettings.plist documentation xD
 
 pictureName    (string)        - name of curent picture
 drawDuration   (number in ms)  - how much time duration will be create picture
 pathColors     ([string])      - array with names of colors
 
 */
