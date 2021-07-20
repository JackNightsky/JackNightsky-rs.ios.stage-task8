//
//  PlistWorker.h
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlistWorker : NSObject

+(NSString*)readValue:(NSString*)key;
+(void)writeValue:(NSString*)key :(NSString*)value;

@end

NS_ASSUME_NONNULL_END
