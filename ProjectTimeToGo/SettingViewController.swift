//
//  SettingViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/18.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var textGoal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textGoal.attributedPlaceholder = NSAttributedString(string: "목표를 적어주세요.", attributes: [.foregroundColor : UIColor(red: 252/255, green: 251/255, blue: 238/255, alpha: 1)])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
