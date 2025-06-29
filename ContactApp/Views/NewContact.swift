//
//  NewContact.swift
//  ContactApp
//
//  Created by Diego Guzman on 25/06/25.
//

import SwiftUI

struct NewContact: View {
    @State private var newContact = Contact.emptyContact
    @Binding var contacts: [Contact]
    
    var body: some View {
       NavigationStack {
           DetailEditView(contact: $newContact, saveEdits: {
               contact in
               contacts.append(newContact)
           })
        }
    }
}

#Preview {
    NewContact(contacts: .constant(Contact.sampleData))
}
