//
//  NextVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/14.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation
import UIKit

class NextVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView?;
    var dataArray:NSMutableArray?;
    // MARK: lifeCircle
    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationItem.title = NSStringFromClass(self.classForCoder);
        dataArray = NSMutableArray.init();
        for _ in 0...10 {
            let model = Model.init();
            model.titleStr = "GSHSHSHSFGSJGIALHGBULAG;AGJHOAIGALGA";
            model.imageURL = "test";
            model.detailStr = "JIFHSLIGHSILGBSKG,BNSSGSGSHSHSHSHSFSVSGSGSGSG"
            dataArray?.add(model);
        }
        self.view.backgroundColor = UIColor.white;
        tableView = InsertTableViewWithConfig(superView: self.view, frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), datasource: self, delegate: self, style: UITableViewStyle.plain);
    }
    
    // MARK: UITableViewDatasouce&Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray?.count)!;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kcellID = "cellID";
//        var cell:MyCell! = tableView.dequeueReusableCell(withIdentifier:kcellID) as? MyCell;
        var cell:MyCell? = (tableView.dequeueReusableCell(withIdentifier: kcellID) as? MyCell);
        if cell == nil {
            cell = MyCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: kcellID);
        }
        cell?.complete = {
            model in
            print(model);
        }
        var model:Model?;
        model = dataArray?.object(at: indexPath.row) as? Model;
        cell?.setCellWithData(model:model!);
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            dataArray?.removeObject(at: indexPath.row);
            tableView.reloadData();
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade);
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除";
    }
    
    // MARK: lifeCircle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: animated);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
}
