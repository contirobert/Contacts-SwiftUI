//
//  ContactDetail.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/8/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI

struct ContactDetail : View {
    let contact: Contact
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Text("\(contact.firstName) \(contact.lastName)")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Text("Phone")
                Spacer()
                Text(contact.phone).color(.gray)
                }.padding(.bottom, 5)
            
            HStack {
                Text("Email")
                Spacer()
                Text(contact.email).color(.gray)
                }.padding(.bottom, 5)
            
            HStack {
                Text("Address")
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(contact.street).color(.gray)
                    Text("\(contact.city), \(contact.state) \(contact.zip)").color(.gray)
                }
                }.padding(.bottom, 5)
            
            HStack {
                Text("Favorite")
                Spacer()
                
                //Toggle()
            }
            
            Spacer()
            }.padding(40)
    }
}
