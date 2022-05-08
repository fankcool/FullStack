//
//  DetailViewController.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

class DetailViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView().initData()
        
        print("*** >>> \(self.current), \(self.handleValue(value: "swift"))")
    }
    
    @objc func imgBtnClick() {
        SVProgressHUD.showInfo(withStatus: "img click")
    }
    
    @objc func opsBtnClick() {
        SVProgressHUD.showInfo(withStatus: "save")
    }
    
    private func addRightBarBtn() {
        
        let imgBar = UIBarButtonItem(image: R.image.home_sel(), style: .plain, target: self, action: #selector(imgBtnClick))
        
        let titleBar = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(opsBtnClick))
        
        titleBar.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemTeal], for: .normal)
        
        titleBar.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemGreen], for: .highlighted)
        
        self.navigationItem.rightBarButtonItems = [titleBar, imgBar]
    }
    
    func initData() {
        print("DetailViewController initData")
    }
    
    func initView() -> Self {
        self.title = "详情"
        
        self.addRightBarBtn()
        
        return self
    }
}
