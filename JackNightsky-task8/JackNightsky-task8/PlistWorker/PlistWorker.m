//
//  PlistWorker.m
//  JackNightsky-task8
//
//  Created by Jack on 20.07.21.
//

#import "PlistWorker.h"

@implementation PlistWorker


+(NSString*)readValue:(NSString*)key {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"pictureSettings.plist"];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath: path])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"pictureSettings" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: path error:&error];
    }
    
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    //load from savedStock example int value
    NSString * value = [savedStock objectForKey:key];
//    NSLog(@"key-value: %@ : %@", key, value);
    return value;
}

+(void)writeValue:(NSString*)key :(NSString*)value {
    // plist
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"pictureSettings.plist"];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"pictureSettings" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    // write value
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    [data setObject:value forKey:key];
    [data writeToFile: path atomically:YES];
    
}

@end
