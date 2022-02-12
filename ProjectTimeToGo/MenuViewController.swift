//
//  MenuViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2022/02/12.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBtnInstagram(_ sender: UIButton) {
        let instagram = "https://www.instagram.com/lazy_cookie_lazy"
        
        let instagramURL = NSURL(string: instagram)
        
        if UIApplication.shared.canOpenURL(instagramURL! as URL) {
            UIApplication.shared.open(instagramURL! as URL, options: [:], completionHandler: nil)
        }
    }
}
