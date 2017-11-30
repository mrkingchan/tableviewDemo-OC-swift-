//
//  Model.m
//  tableviewDemo
//
//  Created by Chan on 2017/9/14.
//  Copyright © 2017年 Chan. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0 ;
    Ivar *vars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(vars[i])];
        id value = [self valueForKey:key];
        if (value == nil) {
            continue;
        }
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    id model = [[self class] new];
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self  class], &count);
    for (int i = 0; i< count; i ++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [self valueForKey:key];
        if (value == nil) {
            continue;
        }
        [model setValue:value forKey:key];
    }
    return model;
}
@end
