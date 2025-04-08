//
//  Period.swift
//  GitHub Projects
//
//  Created by Maria Budkevich on 07/04/2025.
//

import Foundation

enum Period {
    case week
    case month
    
    var fromDate: Date {
        let calendar = Calendar.current
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let moveTo = self == .month ? -30 : -7
        let fromDate = calendar.date(byAdding: .day, value: moveTo, to: today)
        return fromDate ?? today
    }
}
