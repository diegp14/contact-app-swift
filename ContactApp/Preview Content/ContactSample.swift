//
//  ContactSample.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import Foundation

extension Contact {
    
    static let sampleData: [Contact] = {
        let calendar = Calendar.current
        
        return [Contact(name: "Fernando", phoneNumber: "3171284611",
                       birthday: calendar.date(from: DateComponents(year: 1990, month: 07, day: 15))!),
                Contact(name: "Veronica", phoneNumber: "3171061111",
                               birthday: calendar.date(from: DateComponents(year: 1987, month: 02, day: 12))!),
                Contact(name: "Damian", phoneNumber: "3135353344",
                               birthday: calendar.date(from: DateComponents(year: 2001, month: 10, day: 27))!)
        
        
        ]
        
    }()
}
