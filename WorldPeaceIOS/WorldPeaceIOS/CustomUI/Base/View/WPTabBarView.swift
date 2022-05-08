//
//  WPTabBarView.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

protocol WPTabBarViewDelegate : NSObjectProtocol {
    func tabBarViewSelectFunc(fromIndex: Int, toIndex: Int)
}

class WPTabBarView: UIView {
    
    var selectBtn : UIButton?
    
    var badgeView : UIView?
    
    var item : UITabBarItem?
    
    var badgeValue : String?
    
    var delegate : WPTabBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonWithItem(item: UITabBarItem) {
        
        let button = WPButton(type: .custom)
        button.item = item
        button.setTitle(item.title, for: .normal)
        button.setTitle(item.title, for: .selected)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(UIColor(red: 255 / 255, green: 83 / 255, blue: 70 / 255, alpha: 1), for: .selected)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
        button.tag = self.subviews.count
        self.addSubview(button)
        
        // 默认选中第一个按钮
        if self.subviews.count == 1 {
            self.buttonClicked(button: button)
        }
        
        // 给第三个按钮添加小红点
//        if button.tag == 3 {
//            let view = UIView(frame: CGRect(x: self.width / 4 - 30, y: 0, width: 8, height: 8))
//            view.backgroundColor = UIColor.blueColor()
//            view.layer.masksToBounds = true
//            view.layer.cornerRadius = 3.5
//            view.hidden = true
//            button.addSubview(view)
//            self.badgeView = view
//        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var btnX : CGFloat = 0
        let btnY : CGFloat = 3
        let btnW = self.width / CGFloat(self.subviews.count)
        let btnH = self.height - 3
        
        for (index, value) in self.subviews.enumerated() {
            btnX = CGFloat(index) * btnW
            value.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
        }
    }
    
    // 根据badgeValue的值确定小红点是否显示
    func updateBadgeValue(badgeValue: String, index: Int) {
        self.badgeValue = badgeValue
        if index == 3 {
            if self.badgeValue == "1" {
                self.badgeView?.isHidden = false
            } else {
                self.badgeView?.isHidden = true
            }
        }
    }
    
    @objc func buttonClicked(button: WPButton) {
        
        if delegate != nil {
            self.delegate?.tabBarViewSelectFunc(fromIndex: self.selectBtn!.tag, toIndex: button.tag)
        } else {
//            print("代理为空")
        }
        
        if button == self.selectBtn {
            return
        }
        
        self.selectBtn?.isSelected = false
        
        button.isSelected = true
        
        self.selectBtn = button
    }
}
