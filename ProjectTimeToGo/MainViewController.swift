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
                                      radius: 130,
                                      startAngle: -(.pi/2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackCircle = CAShapeLayer()
        trackCircle.fillColor = UIColor.clear.cgColor
        trackCircle.path = circlePath.cgPath
        trackCircle.lineWidth = 40
        trackCircle.strokeColor = UIColor(displayP3Red: 252/255, green: 251/255, blue: 238/255, alpha: 1).cgColor
        
        shap.path = circlePath.cgPath
        shap.lineWidth = 20
        shap.strokeColor = UIColor(displayP3Red: 239/255, green: 155/255, blue: 131/255, alpha: 1).cgColor
        shap.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(trackCircle)
        view.layer.addSublayer(shap)
    }
}
