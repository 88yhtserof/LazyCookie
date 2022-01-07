//
//  Goal.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/21.
//

import Foundation

class Goal {
    var goal: String = "목표 없다."
    var hour: Int
    var minute: Int
    var achievement: String = "짝짝짝"
    var failure: String = "..."
    
    init(goal: String, hour: Int, minute: Int, achievement: String, failure: String) {
        if !goal.isEmpty {
            self.goal = goal
        }
        if !achievement.isEmpty {
            self.achievement = achievement
        }
        if !failure.isEmpty {
            self.failure = failure
        }
        self.hour = hour
        self.minute = minute
    }
}
