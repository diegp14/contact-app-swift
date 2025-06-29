//
//  DetailView.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var contact: Contact
    @State private var showEditView = false
    @State private var editingContact = Contact.emptyContact
    
    var body: some View {
      List {
          Section(header: Text("Contact Info")){
              
              HStack {
                  Label(contact.name, systemImage: "person.fill")
                  .font(.headline)
              }
              
              HStack {
                  Label(contact.phoneNumber, systemImage: "phone.fill")
              }
              
              HStack {
                  Label("\(contact.birthday.formatted(.dateTime.year().month().day()))", systemImage: "birthday.cake.fill")

              }
          }
          
        }
      .navigationTitle("Contact")
      .toolbar {
                 Button("Edit") {
                     showEditView = true
                     editingContact = contact
                 }
             }
      .sheet(isPresented: $showEditView){
          NavigationStack{
              DetailEditView(contact: $editingContact, saveEdits: {
                  contac in
                  contact = editingContact
              })
              
                  .navigationTitle("Contact Edit")
                
          }
      }
       
    }
}

#Preview {
    @Previewable @State var contact = Contact.sampleData[0]
    NavigationStack {
        DetailView(contact: $contact)
    }
    
}
