//
//  HomeViewController.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/4.
//

import Foundation

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        print("*** >>> HomeViewController viewDidLoad")
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            SVProgressHUD.showSuccess(withStatus: "发送成功")
        case 2:
            SVProgressHUD.showInfo(withStatus: "发送失败")
        case 3:
            self.navigationController?.pushViewController(R.storyboard.home.detailViewController()!, animated: true)
        default:
            break
        }
    }
}
