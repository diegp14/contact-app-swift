//
//  Contact.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import Foundation


struct Contact: Identifiable {
    var id: UUID
    var name: String
    var phoneNumber: String
    var birthday: Date
    
    init(id: UUID = UUID(), name: String, phoneNumber: String, birthday: Date) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.birthday = birthday
    }
    
    static var emptyContact: Contact {
        .init(name: "", phoneNumber: "", birthday: Date())
    }
}

