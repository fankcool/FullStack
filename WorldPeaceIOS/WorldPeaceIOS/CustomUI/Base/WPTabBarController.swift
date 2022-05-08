//
//  WPTabBarController.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

class WPTabBarController: UITabBarController, WPTabBarViewDelegate {
    
    var tabBarView = WPTabBarView()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addController(vc: R.storyboard.home.instantiateInitialViewController()!, title: "首页", imageName: "home_def", selectedImageName: "home_sel")
        
        self.addController(vc: R.storyboard.square.instantiateInitialViewController()!, title: "广场", imageName: "mine_def", selectedImageName: "mine_sel")
        
        self.addController(vc: R.storyboard.shop.instantiateInitialViewController()!, title: "商城", imageName: "home_def", selectedImageName: "home_sel")
        
        self.addController(vc: R.storyboard.mine.instantiateInitialViewController()!, title: "我的", imageName: "mine_def", selectedImageName: "mine_sel")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarView.frame = self.tabBar.bounds
        self.tabBarView.delegate = self
        self.tabBarView.tag = 2008
        
        self.tabBar.clipsToBounds = true // 顶部线
        self.tabBar.barTintColor = .white // 背景色
        
        self.tabBar.addSubview(self.tabBarView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in self.tabBar.subviews {
            if i.isKind(of: UIControl.self) {
                i.removeFromSuperview()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for i in self.tabBar.subviews {
            if i.isKind(of: UIControl.self) {
                i.removeFromSuperview()
            }
        }
    }
    
    func addController(vc: UIViewController, title: String, imageName: String, selectedImageName: String){
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        vc.tabBarItem.title = title
        
        let navigationController = WPNavigationController(rootViewController: vc)
        
        self.addChild(navigationController)
        self.tabBarView.addButtonWithItem(item: vc.tabBarItem)
    }
    
    func tabBarViewSelectFunc(fromIndex: Int, toIndex: Int) {
        self.selectedIndex = toIndex
        print("\(fromIndex) -- \(toIndex)")
    }
}
