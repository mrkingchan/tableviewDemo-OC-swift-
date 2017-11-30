//
//  SettingVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/15.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation

class SettingVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView?;
    var dataArray:NSMutableArray?;
    
    // MARK: lifeCircle
    override func viewDidLoad() {
        super.viewDidLoad();
        dataArray = NSMutableArray.init();
        self.view.backgroundColor = UIColor.white;
        /*tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableViewStyle.plain);
         tableView?.delegate = self;
         tableView?.dataSource = self;
         tableView?.tableFooterView = UIView.init();
         self.view .addSubview(tableView!);*/
        tableView = InsertTableViewWithConfig(superView: self.view, frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), datasource: self, delegate: self, style: UITableViewStyle.plain);
    }
    
    // MARK: UITableViewDataSource&delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let alertController = UIAlertController.init(title: "Chan", message: "Chan", preferredStyle: UIAlertControllerStyle.actionSheet);
        for index in 0..<5 {
            let alertAction = UIAlertAction.init(title: String(index), style:index == 4 ?UIAlertActionStyle.destructive:  UIAlertActionStyle.default) { action in
                print(index);
            };
            alertController.addAction(alertAction);
        }
        self.present(alertController, animated: true, completion: nil);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kcellID = "cellID";
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier:kcellID);
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: kcellID);
        }
        cell.textLabel?.text = NSStringFromClass(self.classForCoder);
        return cell!;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
}
