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
        
        self.navigationItem.hidesBackButton = true
        
        let imageCookie : UIImageView = UIImageView(frame: CGRect(x: view.frame.midX, y: view.frame.height-550, width: 100, height: 100))
        imageCookie.image = UIImage(named: "firstpage.png")
        
        addLayerCircleTimer()
        view.addSubview(imageCookie)
    }
    
    func addLayerCircleTimer() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.width/2, y: view.frame.height-550),
                                      radius: 130,
                                      startAngle: -(.pi/2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackCircle = CAShapeLayer()
        trackCircle.fillColor = UIColor(displayP3Red: 252/255, green: 251/255, blue: 238/255, alpha: 1).cgColor
        trackCircle.path = circlePath.cgPath
        trackCircle.lineWidth = 40
        trackCircle.strokeColor = UIColor(displayP3Red: 252/255, green: 251/255, blue: 238/255, alpha: 1).cgColor
        
        shap.path = circlePath.cgPath
        shap.lineWidth = 20
        shap.strokeColor = UIColor(displayP3Red: 243/255, green: 220/255, blue: 152/255, alpha: 1).cgColor
        shap.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(trackCircle)
        view.layer.addSublayer(shap)
    }
}
