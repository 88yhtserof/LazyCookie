//
//  MainViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var viewTop: UIImageView!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblGoal: UILabel!
    @IBOutlet weak var lblGoalTime: UILabel!
    @IBOutlet weak var imgCookie: UIImageView!
    
    var goal: Goal?
    let shap = CAShapeLayer()
    var duration: Double = 0.0
    var timer = Timer()
    var count = 595

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.btnStart.layer.cornerRadius = 10
        self.btnStart.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.btnStart.layer.shadowOpacity = 0.2
        
        setData()
        addLayerCircleTimer()
        tapImageCookie()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setData() {
        if let goal = self.goal {
            self.lblGoal.text = goal.goal
            self.lblGoalTime.text = "\(goal.hour)시간 \(goal.minute)분"
            self.duration = Double((goal.hour * 60 + goal.minute)*60)
        }
    }
    
    func addLayerCircleTimer() {
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: view.frame.height/7,
                                      startAngle: -(.pi/2),
                                      endAngle: .pi * 2 - (.pi/2),
                                      clockwise: true)
        
        let trackCircle = CAShapeLayer()
        trackCircle.fillColor = UIColor.clear.cgColor
        trackCircle.path = circlePath.cgPath
        trackCircle.lineWidth = 40
        trackCircle.strokeColor = UIColor(displayP3Red: 252/255, green: 251/255, blue: 238/255, alpha: 1).cgColor
        
        shap.path = circlePath.cgPath
        shap.lineWidth = 20
        shap.strokeColor = UIColor(displayP3Red: 243/255, green: 220/255, blue: 152/255, alpha: 1).cgColor
        shap.fillColor = UIColor.clear.cgColor
        shap.strokeEnd = 0
        shap.lineCap = .round
        
        view.layer.addSublayer(trackCircle)
        view.layer.addSublayer(shap)
    }
    
    @IBAction func tapBtnLeave(_ sender: UIButton) {
        let alert = UIAlertController(title: "나가기", message: "홈 화면으로 되돌아가시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let actionYes = UIAlertAction(title: "네", style: UIAlertAction.Style.default) {
            _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        let actionNo = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapBtnStart(_ sender: UIButton) {
        let timeSelector: Selector = #selector(MainViewController.updateTime)
        let interval = 1.0
        self.timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        self.btnStart.isEnabled = false
        self.btnStart.setTitleColor(.brown, for: .normal)
        self.setCircleAnimation()
    }
    
    func setCircleAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shap.add(animation, forKey: "animation")
    }
    
    @objc func updateTime() {
        self.count += 1
        
        if self.count >= Int(self.duration) {
            let alert = UIAlertController(title: "목표 달성", message: "목표 시간을 달성했습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "쿠키 획득", style: .default){_ in
                guard let ResultViewController = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else{ return }
                self.navigationController?.pushViewController(ResultViewController, animated: true)
            }
            action.setValue(UIColor.brown, forKey: "titleTextColor")
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
            self.timer.invalidate()
        }
        
        DispatchQueue.main.async {
            let hour: Int = self.count/(3600)
            let minute: Int = (self.count%3600)/60
            let second: Int = (self.count%60)
            self.lblTimer.text = "\(hour)시간 \(minute)분 \(second)초"
        }
    }
    
    func tapImageCookie() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(actionTapImageCookie))
        imgCookie.isUserInteractionEnabled = true
        imgCookie.addGestureRecognizer(recognizer)
    }
    
    @objc func actionTapImageCookie(){
        guard let CookieDetailsViewController = self.storyboard?.instantiateViewController(identifier: "CookieDetailsViewController") as? CookieDetailsViewController else {return}
        
        self.present(CookieDetailsViewController, animated: true, completion: nil)
    }
}
