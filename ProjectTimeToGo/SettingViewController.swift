//
//  SettingViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/18.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var textGoal: UITextField! {
        didSet{
            textGoal.delegate = self
        }
    }
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var textFieldAchievement: UITextField! {
        didSet{
            textFieldAchievement.delegate = self
        }
    }
    @IBOutlet weak var textFieldFailure: UITextField!{
        didSet{
            textFieldFailure.delegate = self
        }
    }
    @IBOutlet weak var textFieldView: CustomView!
    
    var hour: Int = 1
    var minute: Int = 30
    var goal: Goal? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textGoal.attributedPlaceholder = NSAttributedString(string: "목표를 적어주세요.", attributes: [.foregroundColor : UIColor(red: 252/255, green: 251/255, blue: 238/255, alpha: 1)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let goalString = textGoal.text ?? ""
        let achievement = textFieldAchievement.text ?? ""
        let failure = textFieldFailure.text ?? ""
        
        if let timePickerViewController = segue.destination as? TimePickerViewController {
            timePickerViewController.timePickerDelegate = self
        }

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
    @IBAction func beginTextFieldFailer(_ sender: UITextField) {
        self.keboardWillShow()
    }
    @IBAction func endTextFieldFailer(_ sender: UITextField) {
        self.keboardWillHide()
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
        let hourTitle = self.hour < 10 ? "0\(self.hour)" : "\(self.hour)"
        let minuteTitle = self.minute < 10 ? "0\(self.minute)" : "\(self.minute)"
        self.btnTime.setTitle("\(hourTitle):\(minuteTitle)", for: .normal)
    }
}

extension SettingViewController {
    func keboardWillShow(){
        self.view.frame.origin.y -= textFieldView.frame.height
    }
    
    func keboardWillHide(){
        self.view.frame.origin.y += textFieldView.frame.height
    }
}

extension SettingViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
