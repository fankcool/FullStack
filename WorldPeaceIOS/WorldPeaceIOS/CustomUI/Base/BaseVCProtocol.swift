//
//  BaseVCProtocol.swift
//  WorldPeaceIOS
//
//  Created by fank on 2022/5/5.
//

import UIKit

protocol BaseVCProtocol {
    
    var current : String { get }
    
    func handleValue(value: String) -> String
}

extension BaseVCProtocol where Self : BaseViewController {
    
    var current : String {
        return "\(self) \(#function)"
    }
    
    func handleValue(value: String) -> String {
        return "value: \(value)"
    }
}
