//
//  SettingViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/18.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var textGoal: UITextField!
    @IBOutlet weak var btnTime: UIButton!
    
    var hour: Int = 1
    var minute: Int = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textGoal.attributedPlaceholder = NSAttributedString(string: "목표를 적어주세요.", attributes: [.foregroundColor : UIColor(red: 252/255, green: 251/255, blue: 238/255, alpha: 1)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let timePickerViewController = segue.destination as? TimePickerViewController {
            timePickerViewController.timePickerDelegate = self
        }
    }
}

extension SettingViewController: TimePickerDelegate {
    func setTime(hour: Int?, minute: Int?) {
        if let resultHour = hour{
            self.hour = resultHour
        }
        if let resultMinute = minute {
            self.minute = resultMinute
        }
        
        self.btnTime.setTitle("\(self.hour)시간 \(self.minute)분", for: .normal)
    }
}
