//
//  LoginViewController.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/4.
//

import UIKit

class LoginViewController: BaseViewController {
    
    override func viewDidLoad() {
        print("*** >>> LoginViewController viewDidLoad")
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            SVProgressHUD.showInfo(withStatus: "登录成功")
            
            CurrentKeyWindow.rootViewController = R.storyboard.main.instantiateInitialViewController()
        case 2:
            SVProgressHUD.showInfo(withStatus: "注册成功")
        case 3:
            SVProgressHUD.showInfo(withStatus: "找回密码成功")
        default:
            break
        }
    }
}
