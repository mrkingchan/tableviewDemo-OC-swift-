//
//  CateScrollView.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/26.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

class CateScrollView: UIView {
    var titles:NSArray?;
    var bottomLine:UIView?;
    var complete:((String,Int)->())?;
    var position:CGRect? = nil;  //nil代表值缺失，而不是空指针
    var itemWidth:CGFloat?;
    
   class func cateScrollViewWithConfig(frame:CGRect,dataArray:NSArray,complete:@escaping (String,Int)->()) -> CateScrollView {
    return CateScrollView.init(position: frame, dataArray: dataArray, completeBlock: complete);
    }
    
    // MARK:init Method
    init(position:CGRect,
         dataArray:NSArray,
         completeBlock:@escaping (String,Int)->()) {
        super.init(frame: position);
        self.position = position;
        titles = dataArray;
        complete = completeBlock;
        self.setUI();
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUI
    func setUI() -> Void {
        let itemCount = self.titles!.count;
        let itemW = (UIScreen.main.bounds.size.width - CGFloat(itemCount - 1))/CGFloat(itemCount);
        itemWidth = itemW;
        let itemH = (position?.size.height)! - 1;
        //按钮
        for index in 0..<itemCount {
            InsertButtonWithConfig(superView: self,
                                   frame: CGRect.init(x:CGFloat(index) + (itemW * CGFloat(index)), y: 0, width: itemW, height: itemH),
                                   cliptoBounds: false,
                                   cornerRadius: 0.0,
                                   tag: 1103 + index,
                                   title: titles!.object(at: index) as! String,
                                   textFontSize: 15,
                                   textColor: UIColor.black,
                                   textAligment: NSTextAlignment.center,
                                   target: self,
                                   selc: NSSelectorFromString("buttonActionWithSender:"));
        }
        //底部跟随线
        bottomLine = InsertViewWithConfig(superView: self,
                                          frame: CGRect.init(x: 0, y: (self.position?.size.height)! - 1, width: itemW, height: 1.0),
                                          backgroundColor: UIColor.blue,
                                          cliptoBounds: false,
                                          cornerRadius: 0.0);
    }
    
    // MARK: private Method
    func buttonAction(sender:UIButton) -> Void {
        let index = sender.tag - 1103;
        UIView.animate(withDuration: 0.2) {
            self.bottomLine?.setLeft(newLeft: CGFloat(index) * self.itemWidth!) ;
        };
        if complete != nil {
            complete!((titles?.object(at: index) as! String),index);
        }
    }
    
    // MARK: memory Management
    deinit {
        print("deInitialized");
        var property = class_getProperty(self.classForCoder, nil);
        
    }
}
