//
//  WPButton.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

class WPButton: UIButton {

    var typeString : String?
    var bigImageString : String?
    var icon : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.backgroundColor = .clear
        self.isExclusiveTouch = true // 禁用按钮同时点击
    }
    
    var item : UITabBarItem {
        get {
            return UITabBarItem()
        }
        set(newUITabBarItem){
            self.setImage(newUITabBarItem.image, for: .normal)
            self.setImage(newUITabBarItem.selectedImage, for: .selected)
        }
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imgX : CGFloat = 0
        let imgY = self.contentEdgeInsets.top + 3
        let imgw = self.width
//        let imgH = self.currentImage == nil ? 0 : self.currentImage!.size.height
        return CGRect(x: imgX, y: imgY, width: imgw, height: 20)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX : CGFloat = 0
        let titleY = self.currentImage == nil ? 0 : self.currentImage!.size.height + self.contentEdgeInsets.top
        let titleW = self.width
        let titleH = self.currentImage == nil ? 0 : self.height - self.currentImage!.size.height - self.contentEdgeInsets.top
        return CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
