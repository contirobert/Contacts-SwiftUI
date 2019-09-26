//
//  ContactDetail.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/8/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI

struct ContactDetail : View {
    @EnvironmentObject var userData: UserData
    var contact: Contact
    
    var contactIndex: Int {
        userData.contacts.firstIndex(where: { $0.id == contact.id })!
    }
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: CGFloat(200), height: CGFloat(200))
                .overlay(Circle().stroke(Color.white, lineWidth: CGFloat(4)))
                .shadow(radius: CGFloat(10))
            
            HStack {
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.largeTitle)
                
                Button(action: { self.userData.contacts[self.contactIndex].isFavorite.toggle() }) {
                    if self.userData.contacts[self.contactIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .font(.headline)
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            HStack {
                Text("Phone")
                Spacer()
                Text(contact.phone).foregroundColor(.gray)
                }.padding(.bottom, CGFloat(5))
            
            HStack {
                Text("Email")
                Spacer()
                Text(contact.email).foregroundColor(.gray)
                }.padding(.bottom, CGFloat(5))
            
            HStack {
                Text("Address")
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(contact.street).foregroundColor(.gray)
                    Text("\(contact.city), \(contact.state) \(contact.zip)").foregroundColor(.gray)
                }
            }.padding(.bottom, CGFloat(5))
            
            Spacer()
        }.padding(40)
    }
}
