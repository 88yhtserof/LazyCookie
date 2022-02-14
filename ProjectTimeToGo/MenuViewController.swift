//
//  MenuViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2022/02/12.
//

import UIKit
import MessageUI

class MenuViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
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
    @IBAction func tapBtnSendEmail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let composeViewController = MFMailComposeViewController()
            composeViewController.mailComposeDelegate = self
            
            composeViewController.setToRecipients(["88yhtserofg@gmail.com"])
            composeViewController.setSubject("[게으른쿠키] 문의")
            
            self.present(composeViewController, animated: true, completion: nil)
        }else{
            showAlertErrorSendMail()
        }
    }
    
    func showAlertErrorSendMail() {
        let alert = UIAlertController(title: nil, message: "이메일을 등록해주세요.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        action.setValue(UIColor.brown, forKey: "TitleTextColor")
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
