//
//  ViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgLazyOwner: UIImageView!
    @IBOutlet weak var lblNumberOfCookies: UILabel!
    
    var cookies: [Cookie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        tapImageLazyOwner()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
        debugPrint("!")
    }
    
    func setData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "cookies") as? [[String: Any]] else {return}
        
        debugPrint("data:\(data)")
        self.cookies = data.compactMap{
            guard let goal = $0["goal"] as? String else {return nil}
            guard let hour = $0["hour"] as? Int else {return nil}
            guard let minute = $0["minute"] as? Int else {return nil}
            return Cookie(goal: goal, hour: hour, minute: minute)
        }
        debugPrint("cookies:\(cookies)")
        
        self.lblNumberOfCookies.text = String(self.cookies.count)
        
        guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
        debugPrint("main:\(cookies)")
        mainViewController.cookies = self.cookies
        
    }
    
    func tapImageLazyOwner() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(actionTapImageLazyOwner))
        imgLazyOwner.isUserInteractionEnabled = true
        imgLazyOwner.addGestureRecognizer(recognizer)
    }
    
    @objc func actionTapImageLazyOwner() {
        guard let lazyOwnerDetailsViewController = self.storyboard?.instantiateViewController(identifier: "LazyOwnerDetailsViewController") as? LazyOwnerDetailsViewController else {return}
        lazyOwnerDetailsViewController.modalTransitionStyle = .flipHorizontal
        
        self.present(lazyOwnerDetailsViewController, animated: true, completion: nil)
    }

}

