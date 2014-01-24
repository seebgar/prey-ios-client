//
//  JsonConfigParser.m
//  Prey
//
//  Created by Carlos Yaconi on 18-12-12.
//  Copyright (c) 2012 Fork Ltd. All rights reserved.
//

#import "JsonConfigParser.h"
#import "NewModulesConfig.h"

@implementation JsonConfigParser


- (NewModulesConfig*) parseModulesConfig:(NSString*)request parseError:(NSError **)err
{
    NSError *error = nil;
    NSData *jsonData = [request dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NewModulesConfig *modulesConfig = [[NewModulesConfig alloc] init];
    
    for (NSDictionary *dict in jsonObjects)
    {
        [modulesConfig addModule:dict];
    }
    
    return modulesConfig;
}


@end
