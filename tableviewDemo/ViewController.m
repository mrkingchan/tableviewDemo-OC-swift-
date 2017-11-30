//
//  ViewController.m
//  tableviewDemo
//
//  Created by Chan on 2017/9/4.
//  Copyright © 2017年 Chan. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>

#import "tableviewDemo-Swift.h"

#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    UIView *_views[5];
    NSMutableDictionary *_dicData;
    ALAssetsLibrary *_library;
    NSMutableArray *_groups;
}

@end

@implementation ViewController

/*///构造viewController
- (UIViewController *)viewControllerWithClass:(Class)className
                                        Title:(NSString *)titleStr
                                  normalImage:(UIImage *)normalImage
                                selectedImage:(UIImage *)selectedImage {
    UIViewController *viewController = [className new];
    if ([UIDevice currentDevice].systemVersion.floatValue >=7.0) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titleStr
                                                           image:normalImage
                                                   selectedImage:selectedImage];
        viewController.tabBarItem = item;
    } else {
        [viewController.tabBarItem setFinishedSelectedImage:selectedImage
                                withFinishedUnselectedImage:normalImage];
        
    }
    return viewController;
}*/

#pragma mark --LifeCircle
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    _groups = [NSMutableArray new];
    _library = [ALAssetsLibrary new];
    [_library enumerateGroupsWithTypes:ALAssetsGroupAll
                            usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                NSString *groupName = [group valueForProperty:ALAssetsGroupPropertyName];
                                [_groups addObject:groupName];
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [_tableView reloadData];
                                });
                                if (group.numberOfAssets) {
                                    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                    }];
                                }
                            } failureBlock:^(NSError *error) {
                                NSLog(@"error = %@",error);
                            }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //成员变量
    unsigned int count = 0;
    Ivar *vars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(vars[i])];
        @try {
            id value = [self valueForKey:key];
            NSLog(@"key = %@,value = %@",key,value);
        } @catch (NSException *exception) {
            NSLog(@"exception = %@",exception.name);
        } @finally {
        }
    }
    /*objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i ++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        @try {
            id value = [self valueForKey:key];
            NSLog(@"key = %@,value = %@",key,value);
        } @catch (NSException *exception) {
            NSLog(@"exception = %@",exception.userInfo);
        } @finally {
            
        }
    }*/
}

#pragma mark --LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    _dicData = [NSMutableDictionary new];
    _dataArray = [NSMutableArray new];
    for (int i = 0; i < 5; i ++) {
        NSMutableArray *temArray = [NSMutableArray new];
        for (int j = 0; j < 5; j ++) {
            [temArray addObject:[NSString stringWithFormat:@"data:seciton :%zd--- row:%zd",i,j]];
        }
        [_dataArray addObject:temArray];
    }
    
    for (int i = 0; i < _dataArray.count; i ++) {
        [_dicData setValue:@(1) forKey:[NSString stringWithFormat:@"%zd",i]];
    }
    [self setUI];
}

#pragma mark --setUI
- (void)setUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    for (int i = 0; i < 5; i ++) {
        _views[i] = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        _views[i].userInteractionEnabled = YES;
        [_views[i] addGestureRecognizer:tap];
        _views[i].backgroundColor = [UIColor blueColor];
        _views[i].tag = i;
    }
}

#pragma mark --private Method
- (void)tapAction:(UITapGestureRecognizer *)tap {
    UIView *view = (UIView *)tap.view;
    NSInteger tag = view.tag;
    view.autoresizesSubviews = !view.autoresizesSubviews;
    [_dicData setValue:view.autoresizesSubviews ?  @(1) :@(0) forKey:[NSString stringWithFormat:@"%zd",tag]];
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:tag] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark --UITableViewDataSource&Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dicData[[NSString stringWithFormat:@"%zd",section]] integerValue] == 0 ? 0 :[_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kcellID = @"kcellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kcellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kcellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    puts(__func__);
    NextVC *VC = [NextVC new];
    [self.navigationController pushViewController:VC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section  {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _views[section];
}

#pragma mark --memory Management
- (void)dealloc {
    if (_tableView) {
        _tableView = nil;
    }
    if (_dataArray) {
        _dataArray = nil;
    }
    if (_dicData) {
        _dicData = nil;
    }
    if (_views) {
        for (int i =  0; i < 5; i ++) {
            _views[i] = nil;
        }
    }
}

///构造viewControllerWithConfiguration
- (UIViewController *)viewControllerWithClass:(Class)className
                                        Title:(NSString *)titleStr
                                  normalImage:(UIImage*)normalImage
                                selectedImage:(UIImage *)selectedImage {
    UIViewController *viewController = [className new];
    viewController.title = titleStr;
    if ([UIDevice currentDevice].systemVersion.floatValue >=7.0) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titleStr
                                                   image:normalImage
                                                   selectedImage:selectedImage];
        viewController.tabBarItem = item;
    } else {
        [viewController.tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
    }
    return  viewController;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    puts(__func__);
}
/*+ (id)objectFromDictionary:(NSDictionary *)dictionary className:(NSString *)name {
    //name为 仅定义的属性的类名
    if (dictionary == nil || name == nil || name.length == 0) {
        return nil;
    }
    id object = [[NSClassFromString(name) alloc]init];
    @try {
        id classObject = objc_getClass([name UTF8String]);
        unsigned int count = 0;
        objc_property_t *properties = class_copyPropertyList(classObject, &count);
        Ivar * ivars = class_copyIvarList(classObject, nil);
        for (int i = 0; i < count; i ++) {
            NSString *memberName = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
            const char *type = ivar_getTypeEncoding(ivars[i]);
            NSString *dataType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
            
            NSLog(@"Data %@ type: %@",memberName,dataType);
            
            JsonToModelDataType rtype = JsonToModelDataTypeObject;
            if ([dataType hasPrefix:@"c"])
            {
                // BOOL
                rtype = JsonToModelDataTypeBOOL;
            } else if ([dataType hasPrefix:@"i"])
            {
                // int
                rtype = JsonToModelDataTypeInteger;
            } else if ([dataType hasPrefix:@"f"])
            {
                // float
                rtype = JsonToModelDataTypeFloat;
            } else if ([dataType hasPrefix:@"d"])
            {
                // double
                rtype = JsonToModelDataTypeDouble;
            } else if ([dataType hasPrefix:@"l"])
            {
                // long
                rtype = JsonToModelDataTypeLong;
            }
            
            for (int j = 0; j < count; j ++)
            {
                objc_property_t property = properties[j];
                NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                NSRange range = [memberName rangeOfString:propertyName];
                if (range.location == NSNotFound) {
                    continue;
                } else {
                    id propertyValue = [dictionary objectForKey:propertyName];
                    
                    switch (rtype) {
                        case JsonToModelDataTypeBOOL:
                        {
                            BOOL temp = [[NSString stringWithFormat:@"%@",propertyValue] boolValue];
                            propertyValue = [NSNumber numberWithBool:temp];
                        }
                            break;
                        case JsonToModelDataTypeInteger:
                        {
                            int temp = [[NSString stringWithFormat:@"%@",propertyValue] intValue];
                            propertyValue = [NSNumber numberWithInt:temp];
                        }
                            break;
                        case JsonToModelDataTypeFloat:
                        {
                            float temp = [[NSString stringWithFormat:@"%@",propertyValue] floatValue];
                            propertyValue = [NSNumber numberWithFloat:temp];
                        }
                            break;
                        case JsonToModelDataTypeDouble:
                        {
                            double temp = [[NSString stringWithFormat:@"%@",propertyValue] doubleValue];
                            propertyValue = [NSNumber numberWithDouble:temp];
                        }
                            break;
                        case JsonToModelDataTypeLong:
                        {
                            long long temp = [[NSString stringWithFormat:@"%@",propertyValue] longLongValue];
                            propertyValue = [NSNumber numberWithLongLong:temp];
                        }
                            break;
                            
                        default:
                            break;
                    }
                    
                    [object setValue:propertyValue forKey:memberName];
                    
                    break;
                }
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }@finally {
        return object;
    }
}*/

- (void)setCellWithData:(id)model {
    if ([model isKindOfClass:[NSObject class]]) {
        
    }
}
@end
