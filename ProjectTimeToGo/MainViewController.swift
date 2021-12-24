//
//  MainViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/21.
//

import UIKit

class MainViewController: UIViewController {

    var goal: Goal?
    let shap = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        addLayerCircleTimer()
    }
    
    func addLayerCircleTimer() {
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi/2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackCircle = CAShapeLayer()
        trackCircle.fillColor = UIColor.clear.cgColor
        trackCircle.path = circlePath.cgPath
        trackCircle.lineWidth = 30
        trackCircle.strokeColor = UIColor.systemGray2.cgColor
        
        shap.path = circlePath.cgPath
        shap.lineWidth = 15
        shap.strokeColor = UIColor.black.cgColor
        shap.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(trackCircle)
        view.layer.addSublayer(shap)
    }
}
