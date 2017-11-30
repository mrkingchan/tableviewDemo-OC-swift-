//
//  Common_Define.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/25.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

func DLog<T>(_ messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent;
        print("\(fileName):(\(lineNum))-\(messsage)");
    #endif
}

// MARK:Width&Height
let kScreenWidth = UIScreen.main.bounds.size.width;
let kScreenHeight = UIScreen.main.bounds.size.height;
let kTabbarHeight = 49;
let kStatusBarHeight = 20;
let kNavigationBarHeight = 64;
let kBodyHeight = kScreenHeight - 64 - 49;

// MARK: userDefauls
func kUserDefaults(value:AnyObject,key:String)->Void {
    UserDefaults.standard.set(value, forKey: key);
}

func kSynchronize()->Void {
    UserDefaults.standard.synchronize();
}

func kUserDefaultWithKey(key:String)->AnyObject {
    return UserDefaults.standard.value(forKey: key) as AnyObject;
}

func kValueToString(value:AnyObject)->String {
    return String(describing: value);
}

func kRemoveDefaultWithKey(key:String)->Void {
    UserDefaults.standard.removeObject(forKey: key);
    UserDefaults.standard.synchronize();
}
