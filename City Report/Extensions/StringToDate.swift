//
//  StringToDate.swift
//  City Report
//
//  Created by Rayana Prata Neves on 18/07/22.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "MM/dd/yyyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
