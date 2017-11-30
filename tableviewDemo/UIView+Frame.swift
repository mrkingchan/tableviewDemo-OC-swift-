//
//  UIView+Frame.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/25.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    // MARK: set&get Method
    func X() -> CGFloat {
        return self.frame.origin.x;
    }
    func setX(newX:CGFloat) -> Void {
        var frame = self.frame;
        frame.origin.x = newX;
        self.frame = frame;
    }
    
    func Y() -> CGFloat {
        return self.frame.origin.y;
    }
    func setY(newY:CGFloat) -> Void {
        var frame = self.frame;
        frame.origin.y = newY;
        self.frame = frame;
    }
    
    func top() -> CGFloat {
        return self.frame.origin.y;
    }
    
    func setTop(newTop:CGFloat) -> Void {
        var frame = self.frame;
        frame.origin.y = newTop;
        self.frame = frame;
    }
    
    func bottom() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height;
    }
    
    func setBottom(newBottom:CGFloat) -> Void {
        var frame = self.frame;
        frame.origin.y = newBottom - self.frame.size.height;
    }
    
    func left() -> CGFloat {
        return self.frame.origin.x;
    }
    
    func setLeft(newLeft:CGFloat) -> Void {
        var frame = self.frame;
        frame.origin.x = newLeft;
        self.frame = frame;
    }
    
    
    func right() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width;
    }
    func setRight(newRight:CGFloat) -> Void {
        var frame = self.frame;
        frame.origin.x = newRight - self.frame.size.width;
        self.frame = frame;
    }
    
    func size() -> CGSize {
        return self.frame.size;
    }
    
    func setSize(newSize:CGSize) -> Void {
        var frame = self.frame;
        frame.size = newSize;
        self.frame = frame;
    }
    
    func origin() -> CGPoint {
        return self.frame.origin;
    }
    
    func setOrigin(newOrigin:CGPoint) -> Void {
        var frame = self.frame;
        frame.origin = newOrigin;
        self.frame = frame;
    }
    
    func centerX() -> CGFloat {
        return self.center.x;
    }
    func setCenterX(newX:CGFloat) -> Void {
        var center = self.center;
        center.x = newX;
        self.center = center;
    }
    
    func centerY() -> CGFloat {
        return self.center.y;
    }
    
    func setCenterY(newY:CGFloat) -> Void {
        var center = self.center;
        center.y = newY;
        self.center = center;
    }
    
    func setCenter(newCenter:CGPoint) -> Void {
        self.center = newCenter;
        self.center = CGPoint.init(x: self.centerX(), y: self.centerY());
    }
}
