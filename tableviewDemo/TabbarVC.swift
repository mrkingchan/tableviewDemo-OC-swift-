//
//  TabbarVC.swift
//  tableviewDemo
//
//  Created by Chan on 2017/9/14.
//  Copyright © 2017年 Chan. All rights reserved.
//

import Foundation

class TabbarVC: UITabBarController {
    var childVCs:NSMutableArray?;
    class func viewControllerWithConfig(title:String,classStr:AnyClass,norImage:String,selectedImage:String) -> UIViewController {
        //as? 转换的可以是nil 需要拆包 as!则保证一定有值
        /*let classType = NSClassFromString(NSStringFromClass(classStr)) as? UIViewController.Type;
        if classType != nil {
            let VC = classType?.init();
        }*/
        let viewController:UIViewController = NSObject.swiftClassFromString(className: NSStringFromClass(classStr));
        let item = UITabBarItem.init(title: title, image: UIImage.init(named: norImage), selectedImage: UIImage.init(named: selectedImage));
        viewController.title = title.components(separatedBy: ".").last;
        viewController.tabBarItem = item;
        return viewController;
    }

    // MARK: lifeCircle
    override func viewDidLoad() {
        super.viewDidLoad();
        childVCs = NSMutableArray.init();
        let titles = [NSStringFromClass(MessageVC.classForCoder()),
                      NSStringFromClass(ContactVC.classForCoder()),
                      NSStringFromClass(SettingVC.classForCoder())];
        let viewControllers:NSMutableArray = NSMutableArray.init();
        for classStr in titles {
            let viewController = TabbarVC.viewControllerWithConfig(title: classStr, classStr: NSClassFromString(classStr)!, norImage: "item", selectedImage: "item");
            let navigationController = UINavigationController.init(rootViewController: viewController);
            viewControllers.add(navigationController);
        }
        self.viewControllers = viewControllers as? [UIViewController];
        ///全局设置
        UINavigationBar.appearance().tintColor = UIColor.white;
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.black], for: UIControlState.normal);
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blue], for: UIControlState.selected);
    }
    
}
