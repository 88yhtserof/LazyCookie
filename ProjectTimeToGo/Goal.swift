//
//  Goal.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/21.
//

import Foundation

class Goal {
    var goal: String
    var hour: Int
    var minute: Int
    var achievement: String
    var failure: String
    
    init(goal: String, hour: Int, minute: Int, achievement: String, failure: String) {
        self.goal = goal
        self.hour = hour
        self.minute = minute
        self.achievement = achievement
        self.failure = failure
    }
}
