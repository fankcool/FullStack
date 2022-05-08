//
//  WPNavigationController.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

class WPNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        self.setupNavigationBarItem()
        self.setupBarButtonItem()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.setupNavigationBarItem()
        self.setupBarButtonItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationBarItem(){
        let navi = UINavigationBar.appearance()
//        navi.setBackgroundImage(UIImage(named: "nav_background_blue"), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navi.shadowImage = UIImage() // 隐藏导航栏下面的一条灰线
        navi.barTintColor = .white // 导航栏背景色
        navi.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.systemTeal] // 导航栏标题字体颜色
    }
    
    func setupBarButtonItem() { // 返回按钮字体
        let item = UIBarButtonItem.appearance()
        item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            
            // 如果为YES，当这个控制器push的时候，底部的Bar，比如Tabbar会滑走，也就是不会在push后的视图上显示出来，默认值为false
            viewController.hidesBottomBarWhenPushed = true
//            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(forNavi: "nav_back", target: self, sel: #selector(popViewControllerAnimated))
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let array = super.popToRootViewController(animated: animated)
        
        let tab = UIApplication.shared.keyWindow?.rootViewController as! UITabBarController
        
        for i in tab.tabBar.subviews {
            if i.isKind(of: UIControl.self) {
                i.removeFromSuperview()
            }
        }
        
        return array
    }
    
    // 必须重写此方法，来删除重新出现的系统的tabbar
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        let array = super.popToViewController(viewController, animated: animated)
        
        for i in (viewController.tabBarController?.tabBar.subviews)! {
            if i.isKind(of: UIControl.self) {
                i.removeFromSuperview()
            }
        }
        
        return array
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
}
