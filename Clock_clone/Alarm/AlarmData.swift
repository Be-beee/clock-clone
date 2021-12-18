//
//  AlarmData.swift
//  Clock_clone
//
//  Created by 서보경 on 2021/12/18.
//

import UIKit

struct AlarmData {
    var time: Date
    var repeatNum: [String] // [월, 목]과 같이 다양한 경우의 수가 포함될 수 있음
    var labelInfo: String
    var sound: String
    var isRepeatAgain: Bool
    var isSoundOn: Bool
}
