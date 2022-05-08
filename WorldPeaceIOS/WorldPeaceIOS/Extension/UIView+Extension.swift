//
//  UIView+Extension.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit
import Foundation

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        
        return self.description().split(separator: ".").last!.description
    }
}

extension UITableViewCell: ReusableView { }

extension UICollectionViewCell: ReusableView { }

protocol Nibloadable : class {}

extension Nibloadable {
    static func loadFromNib(name: String? = "\(Self.self)", owner: UIViewController? = nil) -> Self {
        return UINib(nibName: name!, bundle: nil).instantiate(withOwner: owner == nil ? nil : owner!, options: nil).last as! Self
    }
}

// MARK: frame
extension UIView : Nibloadable {
    
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var right: CGFloat {
        get {
            return self.left + self.width
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.top + self.height
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set(newOrigin) {
            var frame = self.frame
            frame.origin = newOrigin
            self.frame = frame
        }
    }
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newX) {
            var frame = self.frame
            frame.origin.x = newX
            self.frame = frame
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newY) {
            var frame = self.frame
            frame.origin.y = newY
            self.frame = frame
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set(newSize) {
            var frame = self.frame
            frame.size = newSize
            self.frame = frame
        }
    }
    
    public var maxX: CGFloat {
        get {
            return self.x + self.width
        }
    }
    
    public var maxY: CGFloat {
        get {
            return self.y + self.height
        }
    }
    
    public var minX: CGFloat {
        get {
            return self.x
        }
    }
    
    public var minY: CGFloat {
        get {
            return self.y
        }
    }
    
    func addBorderWith(view: UIView, top: Bool? = false, left: Bool? = false, bottom: Bool? = false, right: Bool? = false, color: UIColor, width: CGFloat) {
        
        if top! {
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: 0, width: view.width, height: width)
            layer.backgroundColor = color.cgColor
            view.layer.addSublayer(layer)
        }
        
        if left! {
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: 0, width: width, height: view.height)
            layer.backgroundColor = color.cgColor
            view.layer.addSublayer(layer)
        }
        
        if bottom! {
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: view.height - width, width: view.width, height: width)
            layer.backgroundColor = color.cgColor
            view.layer.addSublayer(layer)
        }
        
        if right! {
            let layer = CALayer()
            layer.frame = CGRect(x: view.width - width, y: 0, width: width, height: view.height)
            layer.backgroundColor = color.cgColor
            view.layer.addSublayer(layer)
        }
    }
}

// MARK: - get view controller
public extension UIView {
    var viewController: UIViewController? {
        var responder: UIResponder? = self
        var viewController: UIViewController? = nil
        while responder != nil {
            responder = responder?.next
            if let responder = responder as? UIViewController {
                viewController = responder
                break
            }
        }
        return viewController
    }
}

// MARK: - add target corners
public extension UIView {
    func addRoundedCorners(corners: UIRectCorner? = .allCorners, radii: CGSize) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners!, cornerRadii: radii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

// MARK: - scroll to bottom
public extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if (rows > 0) {
            self.scrollToRow(at: IndexPath(row: rows - 1, section: sections - 1), at: .bottom, animated: animated)
        }
    }
}

extension UIView {
    
    func setInnerView(_ innerViw: UIView) {
        self.subviews.forEach {
            $0.removeFromSuperview()
        }
        self.addSubview(innerViw)
        innerViw.snp.removeConstraints()
        innerViw.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    // 将当前视图转为UIImage
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension UIView {
    //  添加旋转动画
    func addRotationAnim(_ duration: Double = 1.0, _ repeatCount: Float = 100000) {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = repeatCount
        rotationAnim.duration = duration
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false
        
        // 3.将动画添加到layer中
        layer.add(rotationAnim, forKey: nil)
    }
    
    //  移除旋转动画
    func removeRotationAnim() {
        layer.removeAnimation(forKey: "transform.rotation.z")
        layer.removeAllAnimations()
    }
}
