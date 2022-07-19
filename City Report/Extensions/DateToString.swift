//
//  ,c.swift
//  City Report
//
//  Created by Rayana Prata Neves on 18/07/22.
//

import Foundation

extension Date {
    func toString(withFormat format: String = "MM/dd/yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
