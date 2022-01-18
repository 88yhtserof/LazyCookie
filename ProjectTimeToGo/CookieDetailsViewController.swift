//
//  CookieDetailsViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2022/01/16.
//

import UIKit

class CookieDetailsViewController: UIViewController {

    @IBOutlet weak var lblCookieName: UILabel!
    @IBOutlet weak var lblCookieDetails: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblCookieName.text = "초코칩 쿠키"
        self.lblCookieDetails.text =
            """
            1930년 미국의 어느 작은 식당의 재료 부족으로 만들어진 초코칩 쿠키!
            잘게 조각한 초콜릿이 잔뜩 들어가 달콤하며, 바삭한 것부터 꾸덕한 것까지 질감이 다양하다.
            """
        self.lblInfo.text = """
            개발자는 바삭한 초코칩 쿠키를 좋아해요:)
            """
    }
}
