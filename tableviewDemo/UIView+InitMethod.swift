//
//  UIView+InitMethod.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/25.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

// MARK: UI封装，减少代码冗余

// MARK: UIView
func InsertViewWithConfig(superView:UIView?,
                          frame:CGRect,
                          backgroundColor:UIColor,
                          cliptoBounds:Bool,
                          cornerRadius:CGFloat) -> UIView {
    let subView = UIView.init(frame: frame);
    subView.backgroundColor = backgroundColor;
    subView.clipsToBounds = cliptoBounds;
    subView.layer.cornerRadius = cornerRadius;
    if superView != nil {
        superView?.addSubview(subView);
    }
    return subView;
}

// MARK: UIButton
func InsertButtonWithConfig(superView:UIView?,
                       frame:CGRect,
                       cliptoBounds:Bool,
                       cornerRadius:CGFloat,
                       tag:Int,
                       title:String,
                       textFontSize:Int,
                       textColor:UIColor,
                       textAligment:NSTextAlignment,
                       target:AnyObject,
                       selc:Selector)->UIButton {
                        let button = UIButton.init(type: UIButtonType.custom);
    button.frame = frame;
    button.clipsToBounds = cliptoBounds;
    button.layer.cornerRadius = cornerRadius;
    button.tag = tag;
    button.setTitle(title, for: UIControlState.normal);
    button.setTitleColor(textColor, for: UIControlState.normal);
    button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(textFontSize));
    button.titleLabel?.textAlignment = textAligment;
    button.addTarget(target, action: selc, for: UIControlEvents.touchUpInside);
    if superView != nil && (superView?.isKind(of: UIView.classForCoder()))! {
        superView?.addSubview(button);
    }
    return button;
}

// MARK: UIimageView
func InsertImageViewWithConfig(superView:UIView?,
                               frame:CGRect,
                               cliptoBounds:Bool,
                               cornerRaius:CGFloat,
                               imageNameStr:String?)->UIImageView {
    let image = UIImageView.init(frame: frame);
    image.clipsToBounds = cliptoBounds;
    image.layer.cornerRadius = cornerRaius;
    if imageNameStr != nil {
        image.image = UIImage.init(named: imageNameStr!);
    }
    if superView != nil {
        superView?.addSubview(image);
    }
    return image;
}

// MARK: UILabel
func InsertLabelWithConfig(superView:UIView?,
                           frame:CGRect,
                           titleStr:String,
                           textColor:UIColor,
                           textFont:Int,
                           textAligment:NSTextAlignment,
                           numberOfLines:Int)->UILabel {
    let label = UILabel.init();
    label.frame = frame;
    label.textAlignment = textAligment;
    label.textColor = textColor;
    label.font = UIFont.systemFont(ofSize: CGFloat(textFont));
    label.text = titleStr;
    label.numberOfLines = numberOfLines;
    if superView != nil {
        superView?.addSubview(label);
    }
    return label;
}

// MARK: UITableView
func InsertTableViewWithConfig(superView:UIView?,
                               frame:CGRect,
                               datasource:AnyObject,
                               delegate:AnyObject,
                               style:UITableViewStyle)->UITableView {
    let tableView = UITableView.init(frame: frame, style: style);
    tableView.delegate = delegate as? UITableViewDelegate;
    tableView.dataSource = datasource as? UITableViewDataSource;
    tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
    tableView.backgroundView = nil;
    tableView.tableFooterView = UIView.init();
    if superView != nil {
        superView?.addSubview(tableView);
    }
    return tableView;
}

// MARK: UICollectionView
func InsertCollectionViewWithConfig(superView:UIView?,
                                    frame:CGRect,
                                    cellClass:AnyClass,
                                    cellIdentify:String,
                                    dataSource:AnyObject,
                                    delegate:AnyObject,
                                    itemSizeW:CGFloat,
                                    itemSizeH:CGFloat,
                                    minSpace:CGFloat,
                                    minInterSpace:CGFloat,
                                    sectionEdgeInsets:UIEdgeInsets)->UICollectionView {
    let layout = UICollectionViewFlowLayout.init();
    layout.minimumLineSpacing = minSpace;
    layout.minimumInteritemSpacing = minInterSpace;
    layout.itemSize = CGSize.init(width: itemSizeW, height: itemSizeH);
    layout.sectionInset = sectionEdgeInsets;
    let collectionView = UICollectionView.init(frame: frame, collectionViewLayout: layout);
    collectionView.backgroundColor = UIColor.white;
    collectionView.dataSource = dataSource as? UICollectionViewDataSource;
    collectionView.delegate = delegate as? UICollectionViewDelegate;
    collectionView.register(cellClass, forCellWithReuseIdentifier: cellIdentify);
    if superView != nil {
        superView?.addSubview(collectionView);
    }
    return collectionView;
}

// MARK: UISWitch
func InsertSwitchWithConfig(superView:UIView?,
                            frame:CGRect) ->UISwitch {
    let swtich = UISwitch.init(frame: frame);
    if superView != nil {
        superView?.addSubview(swtich);
    }
    return swtich;
}
