//
//  Model.h
//  tableviewDemo
//
//  Created by Chan on 2017/9/14.
//  Copyright © 2017年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject <NSCoding>

@property(nonatomic,strong) NSString *imageURL;

@property(nonatomic,strong) NSString *titleStr;

@property(nonatomic,strong) NSString *detailStr;

@end
