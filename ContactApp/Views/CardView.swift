//
//  CardView.swift
//  ContactApp
//
//  Created by Diego Guzman on 15/06/25.
//

import SwiftUI

struct CardView: View {
    let contact: Contact
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            
            
                Text(contact.name)
                    .foregroundColor(.primary)
                    .font(.headline)
            HStack {
                Label(contact.phoneNumber, systemImage: "phone")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Label(formattedBirthday(contact.birthday),
                      systemImage: "birthday.cake")
                
            }
        }
        .padding(10)
        
    }
    
    private func formattedBirthday(_ birthday: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: birthday)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)){
    let contact = Contact.sampleData[0]
    CardView(contact:contact)
}
