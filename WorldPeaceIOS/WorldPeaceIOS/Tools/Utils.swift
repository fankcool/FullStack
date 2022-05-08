//
//  Utils.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

let ScreenWidth : CGFloat = UIScreen.main.bounds.width
let ScreenHeight : CGFloat = UIScreen.main.bounds.height

var KeyWindowBounds : CGRect {
    return UIApplication.shared.keyWindow?.bounds ?? .zero
}

var CurrentKeyWindow : UIWindow {
    return UIApplication.shared.keyWindow ?? UIWindow(frame: UIScreen.main.bounds)
}

var CurrentNavigationController : WPNavigationController? {
    guard let tabbarVC = CurrentKeyWindow.rootViewController as? WPTabBarController, let currentNaviVC = tabbarVC.viewControllers![tabbarVC.selectedIndex] as? WPNavigationController else { return nil }
    return currentNaviVC
}

func MainQueueAsync(after: Double? = 0, execute: @escaping () -> Swift.Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + after!) {
        execute()
    }
}

func GlobalQueueAsync(after: Double? = 0, execute: @escaping () -> Swift.Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + after!) {
        execute()
    }
}

extension Optional {
    func then(_ block: (_ wrapped: Wrapped) throws -> Void) rethrows {
        if let wrapped = self {
            try block(wrapped)
        }
    }
}
