//
//  ResultViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2022/01/16.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.hidesBackButton = true
    }
}
