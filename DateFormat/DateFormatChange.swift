//
//  DateFormat+Extension.swift
//  SeSAC_MemoProject
//
//  Created by 이동기 on 2022/09/02.
//

import Foundation
import UIKit

class DateFormatChange {
 
    private init() { }
    
    static let shared = DateFormatChange()
    
    let todayDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "a hh:mm"
        return formatter
    }()
    
    let weeklyDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    let otherDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd a hh:mm"
        return formatter
    }()
}
