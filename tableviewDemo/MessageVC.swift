//
//  MessageVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/15.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation

class MessageVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView?;
    var dataArray:NSMutableArray?;
    var button:UIButton?;
    // MARK: private Method
    func buttonAction(sender:AnyObject)->Void {
        if sender.isKind(of: UIButton.classForCoder()) {
            let  button = sender as! UIButton;
            let buttonTag = button.tag;
            let classType = self.classForCoder;
            if NSStringFromClass(classType).contains("viewcontroller") {
                let classStr = NSStringFromClass(classType);
            }
        }
    }
    
    func sayHelloTo(someOne:String?) -> Void {
        print(someOne ?? "Chan");
        let valueStr:String = someOne == nil ? "Chan":someOne!;
        print(valueStr);
        print("Hello," + (someOne ?? "Chan"));
    }
    
    func sayHelloto(_ name:String,separator:String,terminal:String) -> String {
        return "Hello" + name + separator  + terminal;
    }
    
    // MARK: lifeCircle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print(kUserDefaultWithKey(key: "King"));
        if #available(iOS 8.0,OSX 10, *) {
            print("-----------");
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad();
        sayHelloTo(someOne: nil);
        print(sayHelloto("Chan", separator: ",", terminal: "!"));
        
        let block:(Int,Int) -> Int = {
            a,b in a + b;
        };
        print(block(100,100));
        
        let standardBlock:(String) -> String = {
            valueStr -> String in
            return valueStr;
        };
        print(standardBlock("Chan"));
        
        let block2:(Int,Int) -> String = {
            a,b -> String in
            return "\(a) + \(b)";
        }
        print(block2(100,100));
        button = UIButton.init(type: UIButtonType.custom);
        button?.frame = CGRect.init(x: 0, y: 0, width: 200, height: 80);
        print("X = \(kValueToString(value: button?.X() as AnyObject)),Y = \(String(describing: button?.Y())),size = \(String(describing: button?.size())),right = \(String(describing: button?.right())),bottom = \(String(describing: button?.bottom()))" );
        button?.backgroundColor = UIColor.blue;
        button?.setTitle("Chan", for: UIControlState.normal);
        button?.setTitleColor(UIColor.white, for: UIControlState.normal);
        button?.titleLabel?.textAlignment = NSTextAlignment.center;
        button?.addTarget(self, action: NSSelectorFromString("buttonActionWithSender:"), for:UIControlEvents.touchUpInside);
        
        
        dataArray = NSMutableArray.init();
        self.view.backgroundColor = UIColor.white;
        /*tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableViewStyle.plain);
        tableView?.delegate = self;
        tableView?.dataSource = self;
        tableView?.tableFooterView = button!;
        self.view .addSubview(tableView!);*/
        tableView = InsertTableViewWithConfig(superView: self.view, frame: CGRect.init(x: 0, y: 0, width: kScreenWidth , height: kScreenHeight), datasource: self, delegate: self, style: UITableViewStyle.plain);
        let headerView = InsertViewWithConfig(superView: nil, frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 60), backgroundColor: UIColor.blue, cliptoBounds: true, cornerRadius: 3.0);
        var cateView = CateScrollView.cateScrollViewWithConfig(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 40), dataArray: ["32434","43543535","4345543","434353"]) { (selectedItem, index) in
            print(selectedItem);
        }
        tableView?.tableHeaderView = cateView;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    // MARK: UITableViewDatasorce&Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let VC = ProductVC.init(nibName: nil, bundle: nil);
        navigationController?.pushViewController(VC, animated: true);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  kcellID:String = "cellID";
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
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    // MARK: memory Management
    deinit {
        print("deInitialized");
    }
}
