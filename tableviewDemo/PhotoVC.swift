
//
//  PhotoVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/10/27.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import AssetsLibrary

class PhotoVC: UIViewController {
    var library:ALAssetsLibrary?;
    override func viewDidLoad() {
        super.viewDidLoad();
        library = ALAssetsLibrary.init();
        library?.enumerateGroupsWithTypes(ALAssetsGroupAll, usingBlock: { (group, stop) in
        }, failureBlock: { (error) in
            
        });
    }
}
