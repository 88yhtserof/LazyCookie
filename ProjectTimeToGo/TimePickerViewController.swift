//
//  TimePickerViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/19.
//

import UIKit

protocol TimePickerDelegate: AnyObject {
    func setTime(hour : Int?, minute : Int?)
}

class TimePickerViewController: UIViewController {
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var hour: Int?
    var minute: Int?
    weak var timePickerDelegate: TimePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.timePicker.setValue(UIColor.brown, forKey: "textColor")
    }
    @IBAction func changedTime(_ sender: UIDatePicker) {
        let time: Date = sender.date
        let calendar: Calendar = Calendar.current
        hour = calendar.component(.hour, from: time)
        minute = calendar.component(.minute, from: time)
    }
    
    @IBAction func tapBtnSetting(_ sender: UIButton) {
        self.timePickerDelegate?.setTime(hour: hour, minute: minute)
        
        dismiss(animated: true, completion: nil)
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
