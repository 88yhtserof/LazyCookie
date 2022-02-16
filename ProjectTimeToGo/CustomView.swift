//
//  CustomView.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/19.
//

import UIKit

class CustomView: UIView {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = 10
            }
        }
    }
    
    @IBInspectable var isShadow : Bool = false {
        didSet {
            if isShadow {
                self.layer.shadowOffset = CGSize(width: 0, height: 4)
                self.layer.shadowOpacity = 0.06
            }
        }
    }
    
}
