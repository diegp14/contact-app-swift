//
//  ContentView.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import SwiftUI

struct ContactsView: View {
    @Binding var contacts: [Contact]
    @State private var isPresentingNewContactView: Bool = false
    var body: some View {
        NavigationStack{
            List($contacts) {
                $contact in
                NavigationLink(destination: DetailView(contact: $contact)){
                    CardView(contact: contact)
                }
            }
            .navigationTitle("Contacts")
            .toolbar{
                Button(action: {
                    isPresentingNewContactView = true
                }){
                    Image(systemName: "plus")
                }
                .padding()
                .accessibilityLabel("New Contact")
        }
        }
        .sheet(isPresented: $isPresentingNewContactView){
            NewContact(contacts: $contacts)
            
        }
        
    }
}

#Preview {
    @Previewable @State var contacts = Contact.sampleData
    ContactsView(contacts: $contacts)
}
