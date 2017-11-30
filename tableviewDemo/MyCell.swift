//
//  MyCell.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/14.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
class MyCell: UITableViewCell {
    var productImageView:UIImageView?;
    var title:UILabel?;
    var detail:UILabel?;
    var complete:((Model)->())?;
    var model:Model?;
    
   // MARK: private Method
    func buttonAction(sender:AnyObject) -> Void {
        if sender.isKind(of: UITapGestureRecognizer.classForCoder()) {
            if complete != nil {
                complete!(self.model!);
            }
        }
    } 
    // MARK: initialize Method
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        /*productImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 80, height: 80));
        productImageView?.clipsToBounds = true;
        productImageView?.layer.cornerRadius = 4.0;
        self.addSubview(productImageView!);*/
        productImageView = InsertImageViewWithConfig(superView: self, frame: CGRect.init(x: 10, y: 10, width: 80, height: 80), cliptoBounds: true, cornerRaius: 5.0, imageNameStr: nil);
        self.isUserInteractionEnabled = true;
        productImageView?.isUserInteractionEnabled = true;
        let gesture = UITapGestureRecognizer.init(target: self, action: NSSelectorFromString("buttonActionWithSender:"));
        productImageView?.addGestureRecognizer(gesture);
        /*title = UILabel.init(frame: CGRect.init(x:100, y: 10, width: 200, height: 35));
        title?.textColor = UIColor.blue;
        title?.textAlignment = NSTextAlignment.center;
        title?.font = UIFont.systemFont(ofSize: 15);
        title?.numberOfLines = 0;
        self.addSubview(title!);*/
        title = InsertLabelWithConfig(superView: self, frame: CGRect.init(x: 100, y: 10, width: 200, height: 30), titleStr: "", textColor: UIColor.black, textFont: 15, textAligment: NSTextAlignment.center, numberOfLines: 0);
        /*detail = UILabel.init(frame: CGRect.init(x: (title?.frame.origin.x)!, y: 55, width: 200, height: 35));
        detail?.textAlignment = NSTextAlignment.center;
        detail?.font = UIFont.systemFont(ofSize: 10);
        detail?.textColor = UIColor.gray;
        detail?.numberOfLines = 0;
        self.addSubview(detail!);*/
        detail = InsertLabelWithConfig(superView: self, frame: CGRect.init(x: (title?.left())!, y: 55, width: 200, height: 35), titleStr: "", textColor: UIColor.gray, textFont: 10, textAligment: NSTextAlignment.center, numberOfLines: 0);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private Method
    func setCellWithData(model:Model) -> Void {
        self.model = model;
        productImageView?.image = UIImage.init(named: model.imageURL);
        title?.text = model.titleStr;
        detail?.text = model.detailStr;
    }

    // MARK: class Method
    class func getCellHeightWithData(model:Any)->CGFloat {
        return 44;
    }
    
    // MARK: memory Management
    deinit {
        print("deInitialized");
    }
}
