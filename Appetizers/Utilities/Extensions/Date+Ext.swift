//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 6/2/21.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        return Calendar.current.date(byAdding: .year,
                                     value: -18,
                                     to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        return Calendar.current.date(byAdding: .year,
                                     value: -110,
                                     to: Date())!
    }
}
