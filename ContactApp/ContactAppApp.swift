//
//  ContactAppApp.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import SwiftUI

@main
struct ContactAppApp: App {
    
    @State private var contacts = Contact.sampleData
    var body: some Scene {
        WindowGroup {
            ContactsView(contacts: $contacts)
        }
    }
}
