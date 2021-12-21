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
    @IBOutlet weak var textFieldAchievement: UITextField!
    @IBOutlet weak var textFieldFailure: UITextField!
    
    var hour: Int = 1
    var minute: Int = 30
    var goal: Goal? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textGoal.attributedPlaceholder = NSAttributedString(string: "목표를 적어주세요.", attributes: [.foregroundColor : UIColor(red: 252/255, green: 251/255, blue: 238/255, alpha: 1)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let timePickerViewController = segue.destination as? TimePickerViewController {
            timePickerViewController.timePickerDelegate = self
        }
        
        let goalString = textGoal.text ?? ""
        let achievement = textFieldAchievement.text ?? ""
        let failure = textFieldFailure.text ?? ""
        
        
        
        if let mainViewController = segue.destination as? MainViewController {
            goal = Goal(goal: goalString,
                        hour: self.hour,
                        minute: self.minute,
                        achievement: achievement,
                        failure: failure)
            
            if let resultGoal = goal {
                mainViewController.goal = resultGoal
            }
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
