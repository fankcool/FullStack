//
//  BaseViewController.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/4.
//

import UIKit
import Foundation

class BaseViewController: UIViewController, BaseVCProtocol {
    
    func println<T>(_ msg: T) {
        let fileName = (#file as NSString).lastPathComponent
        print("fileName: \(fileName) - funcName: \(#function) - lineNum: \(#line) - message: \(msg)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self) \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(self) \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self) \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let window = UIApplication.shared.delegate?.window, let subViews = window?.subviews {
            for subView in subViews {
                if subView is UIStackView {
                    window?.bringSubviewToFront(subView)
                    break
                }
            }
        }
        print("\(self) \(#function)")
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        let superPresent = {
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
        if let presentedVC = self.presentedViewController, presentedVC is UIAlertController {
            presentedVC.dismiss(animated: false, completion: superPresent)
        }else if viewControllerToPresent.presentingViewController == nil {
            superPresent()
        }else if let completion = completion {
            completion()
        }
    }
    
    var topPresentVC: UIViewController {
        
        var topPresentVC = CurrentKeyWindow.rootViewController
        
        repeat {
            if let presentedVC = topPresentVC?.presentedViewController, presentedVC.isKind(of: UIAlertController.self) == false {
                topPresentVC = presentedVC
            }
        } while topPresentVC != nil && topPresentVC?.presentedViewController?.isKind(of: UIAlertController.self) == false
        
        return topPresentVC ?? self
    }
    
    deinit {
        print("\(self) \(#function)")
    }
}
