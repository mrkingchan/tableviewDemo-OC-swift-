//
//  ProductVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/25.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

class ProductVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var collectionView:UICollectionView?;
    
    // MARK: private Method
    func buttonAction(sender:AnyObject)->Void {
        if sender.isKind(of: UIButton.classForCoder()) {
            let  button = sender as! UIButton;
            let buttonTag = button.tag;
        }
    }
    // MARK: lifeCircle
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Chan", style: UIBarButtonItemStyle.plain, target: self, action: Selector("buttonActionWithSender:"));
        self.setUI();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    // MARK: setUI
    func setUI() -> Void {
        self.view.backgroundColor = UIColor.white;
        collectionView = InsertCollectionViewWithConfig(superView: self.view, frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), cellClass: UICollectionViewCell.classForCoder(), cellIdentify: "cell", dataSource: self, delegate: self, itemSizeW: (kScreenWidth - 20)/3, itemSizeH: 100, minSpace: 5, minInterSpace: 5,sectionEdgeInsets: UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5));
    }
    // MARK: UIColletionViewDataSource&Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true);
        let VC = NetVC.init(nibName: nil, bundle: nil);
        self.navigationController?.pushViewController(VC, animated: true);
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100;
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath);
        cell.backgroundColor = UIColor.orange;
        return cell;
    }
    
    // MARK: memory Management
    deinit {
        print("deInitialized");
    }
}
