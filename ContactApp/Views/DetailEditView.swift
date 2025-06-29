//
//  DetailEditView.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var contact: Contact
    @State private var countCharacters: Int = 0
    let saveEdits: (Contact) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Contact Details")) {
                HStack{
                    TextField("Name",text: $contact.name)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .onChange(of: contact.name){
                            _,
                            newValue in
                            if newValue.count > 20 {
                                contact.name = String(newValue.prefix(21))
                            }
                            countCharacters = newValue.count
                            
                            
                        }
                        .onAppear{
                            countCharacters = contact.name.count
                        }
                    Text("\(countCharacters)")
                        .font(.caption)
                        .foregroundColor(countCharacters >= 21 ? .red : .primary)
                }
                if countCharacters > 20 {
                    Label("The field name cannot exceed 20 characters", systemImage: "exclamationmark.triangle.fill")
                        .font(.caption)
                        .foregroundColor(.red)
                }
                
               
                TextField("Phone",text: $contact.phoneNumber)
                .keyboardType(.numberPad)
                
                HStack{
                    DatePicker("Birthday", selection: $contact.birthday, displayedComponents: .date)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction){
                Button("Done"){
                    saveEdits(contact)
                    dismiss()
                }
            }
        }
    }
        
}

#Preview {
    @Previewable @State var contact = Contact.sampleData[0]
    DetailEditView(contact: $contact, saveEdits: {_ in})
}
